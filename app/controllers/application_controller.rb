class ApplicationController < ActionController::API
  include ResponseRenderer
  include ExceptionHandler
  include AuthenticateUser

  # make current_user object available everywhere
  def current_user
    @current_user
  end

end
