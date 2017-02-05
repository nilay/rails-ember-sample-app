class UsersController < ApplicationController
  skip_before_action :validate_user
  # POST users
  def create
    user = @company.users.new user_params
    if user.save
      render_created message: 'User created successfully', data: {user: UserSerializer.new(user)}
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
