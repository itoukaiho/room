class UsersController < ApplicationController
  

 def index
  @user = current_user

 end
  def show
    @user = User.find(params[:id])
 
end
def edit
  @user = User.find(params[:id])
 end

 def update
   @user= User.find(params[:id])

   if @user.update(user_params)
     redirect_to action: :show
   else
     render :edit
   end
 end

 def user_params
  params.require(:user).permit(:email,:name,:img)
 end
end


