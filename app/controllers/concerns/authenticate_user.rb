require 'jwt_auth_token'

module AuthenticateUser
  extend ActiveSupport::Concern

  included do
    # Check for logged in user on every API call
    before_action :validate_user

  end

  module ClassMethods ; end

  protected

  # Middleware to validate token and set current user accordingly
  # Halt execution in case blank/invalid token or failed loading corresponding user
  def validate_user
    token   = request.headers['HTTP_AUTH_TOKEN']
    token ||= params['auth_token']

    unless token.present?
      render_unauthorized "Missing Token"
    end

    if set_current_user(token)
      true
    else
      render_unauthorized message: "Unauthorised"
    end
   end

  # extract user_id from decoded_token and set current_user accordinally
  def set_current_user token
    unless decoded_token = JwtAuthToken.valid?(token)
      render_unauthorized message: "Invalid token"
    end

    @current_user = User.find_by id: decoded_token[0]['user_id']

    render_unauthorized message: "Invalid or expired token" unless @current_user
  end


end
