class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path(@users)
  end

  def withdraw
    @user = current_user
    @user.update(withdrawal: true)
    reset_session
    redirect_to root_path
  end
  
   private
  
  def user_params
    params.require(:user).permit(:user_name, :withdrawal, :image)
  end
  
end
