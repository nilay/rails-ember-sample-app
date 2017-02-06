class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]

  # GET /friends
  def index
    friends = current_user.friends

    render_success data: {
        count: friends.count,
        friends: ActiveModel::Serializer::CollectionSerializer.new(friends, serializer: FriendSerializer)
    }
  end

  # GET /friends/1
  def show
    render_success data: { lead: FriendSerializer.new(@friend) }
  end

  # POST /friends
  def create
    friend = current_user.friends.new(friend_params)
     if friend.save
      render_created data: { friend: FriendSerializer.new(friend) }, message: 'Friend created successfully'
    else
      render_unprocessable_entity message: friend.errors.full_messages.join(', ')
    end
  end

  # PATCH/PUT /friends/1
  def update
    if @friend.update(friend_params)
      render_created data: { friend: FriendSerializer.new(@friend) }, message: 'Friend updated successfully'
    else
      render_unprocessable_entity message: @friend.errors.full_messages.join(', ')
    end
  end

  # DELETE /friends/1
  def destroy
    @friend.destroy
    if @friend.destroy
      render_success data: { message: 'Friend deleted successfully'}
    else
      render_unprocessable_entity message: @friend.errors.full_messages.join(', ')
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = current_user.friends.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email)
    end
end
