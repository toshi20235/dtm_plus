class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end
    
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_path
  end
  
  def destroy
   user = User.find(params[:id])
   comment = user.comment_content
   comment.destroy
   redirect_to admin_user(user.id)
  end
  
  private
  
  def user_params
     params.require(:user).permit(:user_name)
  end
end
