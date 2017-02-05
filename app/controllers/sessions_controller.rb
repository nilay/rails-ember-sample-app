class SessionsController < ApplicationController
  # Filters
  skip_before_action :validate_user

  # POST /sessions
  def create
    # Check required params
    assert_required_params params, [:email, :password]

    if @current_user = User.login(params[:email], params[:password])
      render_success message: 'Logged in successfully', data: { auth_token: @current_user.auth_token, user: UserSerializer.new(@current_user) }
    else
      render_unauthorized message:'Invalid Email/Password'
    end
  end
end
