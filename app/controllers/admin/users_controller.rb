class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
    
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_path
  end
  
  private
  
  def customer_params
     params.require(:user).permit(:user_name, :withdrawal)
  end
end
