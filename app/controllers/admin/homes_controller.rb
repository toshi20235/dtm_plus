class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @users = User.all
  end
  
   private
   
  def customer_params
     params.require(:user).permit(:user_name, :email, :withdrawal)
  end
end
