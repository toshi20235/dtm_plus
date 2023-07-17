class Admin::HomesController < ApplicationController
  def top
    @users = User.all
  end
  
   private
   
  def customer_params
     params.require(:user).permit(:user_name, :email, :withdrawal)
  end
end
