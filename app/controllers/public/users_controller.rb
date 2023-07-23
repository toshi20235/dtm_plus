class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @musics = @user.music
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = current_user
    @user.destroy
    reset_session
    redirect_to root_path
  end

  
   private
  
  def user_params
    params.permit(:user_name, :email, :image)
  end
  
end
