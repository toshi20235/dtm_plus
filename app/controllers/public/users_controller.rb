class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @musics = @user.music
  end

  def edit
    @user = current_user
  end

  def quit
    @user = current_user
  end
 
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def withdrawal
    @user = current_user
    @user.update(withdrawal: true)
    reset_session
    redirect_to root_path
  end
  
   private
  
  def user_params
    params.require(:user).permit(:user_name,:email,:image,:withdrawal)
  end
  
end
