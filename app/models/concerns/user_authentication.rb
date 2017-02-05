require 'jwt_auth_token'

module UserAuthentication
  extend ActiveSupport::Concern

  included do

    # For authentication with password
    has_secure_password

  end

  module ClassMethods

    # Login user using username/email and password
    def login(email, password)
      user = User.find_by(email: email)
      user && user.authenticate(password) ? user : false
    end

  end



  def auth_token
    payload = { user_id: id }
    JwtAuthToken.generate_token(payload)
  end


  # Generate random token for any column passed as an argument
  def generate_token column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
