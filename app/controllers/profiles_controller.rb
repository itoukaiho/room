class ProfilesController < ApplicationController
    def show
        @profile= User.find(params[:id])
    end

    def edit
      @profile = User.find(params[:id])
     end
    
     def update
       @profile= User.find(params[:id])
       
       if @profile.update(users_params)
        redirect_to action: :show
       else
         render :edit
       end
     end
    
     def users_params
      params.require(:user).permit(:name, :img)
     end
    end
    
