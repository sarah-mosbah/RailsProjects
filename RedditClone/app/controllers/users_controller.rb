class UsersController < ApplicationController
 
    skip_before_action :authorized, only: [:new, :create]
    before_action :already_signed, only: [:new, :create]

    def new
        @user=User.new
        render :new
    end

    def create
        @user=User.create(user_params)

        if @user.save
         session[:_token]=@user.id
          redirect_to new_user_path
        else
            flash[:errors]= @user.errors
            redirect_to new_user_path
        end
        
       
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
