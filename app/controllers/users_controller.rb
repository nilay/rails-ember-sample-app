class UsersController < ApplicationController
  skip_before_action :validate_user
  # POST users
  def create
    user = User.new user_params
    if user.save

      #let user login after sucessfull signup attempt
      if @current_user = User.login(user_params[:email], user_params[:password])
        render_success message: 'User created successfully', data: { auth_token: @current_user.auth_token, user: UserSerializer.new(@current_user) }
      else
        render_created message: 'User created successfully', data: {user: UserSerializer.new(user)}
      end

    else
      render_unprocessable_entity message: user.errors.full_messages.join(', ')
    end
  end



  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit :first_name, :last_name, :email, :password
    end
end
