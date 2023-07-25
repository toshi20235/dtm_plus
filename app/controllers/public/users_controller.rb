class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @musics = @user.music
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
    
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
    
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
    
    @user = current_user
    @user.destroy
    reset_session
    redirect_to root_path
  end

  
   private
  
  def user_params
    params.require(:user).permit(:user_name, :email, :image)
  end
  
end
