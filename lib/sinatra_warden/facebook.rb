module Sinatra
  module Warden
    module Facebook
      require File.join(File.dirname(__FILE__), 'facebook_strategy')

      module Helpers

        def client(key, secret)
          @client ||= OAuth2::Client.new(key, secret, :site => 'https://graph.facebook.com')
        end

        def redirect_uri
          uri = URI.parse(request.url)
          uri.path = '/facebook/callback'
          uri.query = nil
          uri.to_s
        end

      end

      def self.registered(app)
        app.helpers Warden::Facebook::Helpers

        app.set :auth_facebook_key, nil
        app.set :auth_facebook_secret, nil
        app.set :auth_facebook_scope, ['email', 'offline']

        app.get '/facebook/login' do
          c = client(options.auth_facebook_key, options.auth_facebook_secret)
          params['authorize_url'] = c.web_server.authorize_url(:redirect_uri => redirect_uri, :scope => options.auth_facebook_scope.join(','))
          authenticate(:strategy => :facebook_oauth)
        end

        app.get '/facebook/callback' do
          # TODO this still does not do anything with serializing into warden session
          c = client(options.auth_facebook_key, options.auth_facebook_secret)
          access_token = c.web_server.access_token(params[:code], :redirect_uri => redirect_uri)
          user = JSON.parse(access_token.get('/me'))

          user.inspect
        end

      end
    end # Facebook

    register Facebook
  end # Warden
end # Sinatra

