class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :add_friend]
  before_action :authenticate_user!
  def index
    @users = []
    User.all.each do |user|
      if !current_user.friends.include?(user) && !current_user.request.include?(user) && !current_user.receiver.include?(user)
        @users << user
      end
    end

      # @friendship = Friendship.new

      # @users_petition = Friendship.where(:accepted=>false, :friend_id=>current_user.id)
      # @users_friends = Friendship.where(:accepted=>true, :user_id=>current_user.id)
      # @users_send = Friendship.where(:accepted=>false, :user_id=>current_user.id)
      #
      # ids = []
      # @users_petition.each do |user|
      #   ids << user.user_id
      # end
      # @users_send.each do |user|
      #   ids << user.friend_id
      # end
      # @users_friends.each do |user|
      #   ids << user.friend_id
      # end
      #
      #
      # @all_others = ids.length > 0 ? User.where('id NOT IN (?)', ids):User.all
  end

  def profile

  end

  def show
    @comment = Comment.new
  end

  def update
    @users = User.all
    respond_to do |format|
      if current_user.update(post_params)
        format.html { render :'users/profile' }
        format.json { render :'users/profile' }
      else
        format.html { render :index }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :last_name, :avatar, :birthday, :phone, :country, :header)
  end

end
