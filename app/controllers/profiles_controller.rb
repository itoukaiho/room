class ProfilesController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def edit
      @profile = User.find(params[:id])
     end
    
     def update
       @profile= User.find(params[:id])
       
       if @profile.update(users_params)
         redirect_to :back
       else
         render :edit
       end
     end
    
     def users_params
      params.require(:user).permit(:name, :img)
     end
    end
    
