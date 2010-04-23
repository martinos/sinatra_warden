Warden::Strategies.add(:password) do
  def authenticate!
    u = User.authenticate(params['email'], params['password'])
    u.nil? ? fail!("Could not log you in.") : success!(u)
  end
end
