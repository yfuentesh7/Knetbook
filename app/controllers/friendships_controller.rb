class FriendshipsController < ApplicationController
  before_action :get_user_data, :only => [:add, :cancel, :accept]
  def create

  end

  def add
    current_user.request << @user
    @user.receiver << current_user

    respond_to do |format|
      format.js
    end
  end

  def cancel
    aux_delete_send_receive
    respond_to do |format|
      format.js
    end
  end

  def accept
    aux_delete_send_receive
    current_user.friends << @user
    @user.friends << current_user
    respond_to do |format|
      format.js
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def get_user_data
    @user = User.find(params[:id])
  end

  def post_params
    params.require(:friendship).permit(:user_id, :friend_id, :accepted)
  end

  def aux_delete_send_receive
    current_user.friends.delete(@user)
    current_user.receiver.delete(@user)
    current_user.request.delete(@user)
    @user.friends.delete(current_user)
    @user.receiver.delete(current_user)
    @user.request.delete(current_user)
  end
end
