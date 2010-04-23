Warden::Strategies.add(:facebook_oauth) do
  def authenticate!
    u = User.authenticate(params['email'], params['password'])
    u.nil? ? fail!("Could not log you in.") : success!(u)
  end
end

Warden::Manager.serialize_into_session {|token| token }
Warden::Manager.serialize_from_session {|token| token_obj }

