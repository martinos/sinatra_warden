module Sinatra
  module Warden
    module Helpers

      # The main accessor to the warden middleware
      def warden
        request.env['warden']
      end

      # Return session info
      #
      # @param [Symbol] the scope to retrieve session info for
      def session_info(scope=nil)
        scope ? warden.session(scope) : scope
      end

      # Check the current session is authenticated to a given scope
      def authenticated?(scope=nil)
        scope ? warden.authenticated?(scope) : warden.authenticated?
      end
      alias_method :logged_in?, :authenticated?

      # Authenticate a user against defined strategies
      def authenticate(*args)
        warden.authenticate!(*args)
      end
      alias_method :login, :authenticate

      # Terminate the current session
      #
      # @param [Symbol] the session scope to terminate
      def logout(scopes=nil)
        scopes ? warden.logout(scopes) : warden.logout
      end

      # Access the user from the current session
      #
      # @param [Symbol] the scope for the logged in user
      def user(scope=nil)
        scope ? warden.user(scope) : warden.user
      end
      alias_method :current_user, :user

      # Store the logged in user in the session
      #
      # @param [Object] the user you want to store in the session
      # @option opts [Symbol] :scope The scope to assign the user
      # @example Set John as the current user
      #   user = User.find_by_name('John')
      def user=(new_user, opts={})
        warden.set_user(new_user, opts)
      end
      alias_method :current_user=, :user=

      # Require authorization for an action
      #
      # @param [String] path to redirect to if user is unauthenticated
      def authorize!(failure_path=nil)
        redirect(failure_path ? failure_path : options.auth_failure_path) unless authenticated?
      end

    end

    def self.registered(app)
      app.helpers Warden::Helpers

      # Enable Sessions
      app.set :sessions, true

      app.set :auth_failure_path, '/'
      app.set :auth_success_path, '/'

      app.set :auth_error_message,   "Could not log you in."
      app.set :auth_success_message, "You have logged in successfully."
      app.set :auth_use_erb, false
      app.set :auth_login_template, :login

      app.post '/unauthenticated/?' do
        status 401
        env['x-rack.flash'][:error] = options.auth_error_message if defined?(Rack::Flash)
        options.auth_use_erb ? erb(options.auth_login_template) : haml(options.auth_login_template)
      end

      app.get '/login/?' do
        options.auth_use_erb ? erb(options.auth_login_template) : haml(options.auth_login_template)
      end

      app.post '/login/?' do
        authenticate
        env['x-rack.flash'][:success] = options.auth_success_message if defined?(Rack::Flash)
        redirect options.auth_success_path
      end

      app.get '/logout/?' do
        authorize!
        logout
        env['x-rack.flash'][:success] = options.auth_success_message if defined?(Rack::Flash)
        redirect options.auth_success_path
      end
    end
  end # Warden

  register Warden
end # Sinatra
