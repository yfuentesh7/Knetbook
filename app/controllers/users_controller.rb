class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  def index
      @users = User.all
  end

  def profile

  end

  def show

  end

  def update
    respond_to do |format|
      if current_user.update(post_params)
        format.html { render :index }
        format.json { render :index }
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
