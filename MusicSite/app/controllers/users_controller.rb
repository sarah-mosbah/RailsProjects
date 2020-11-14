class UsersController < ApplicationController
    before_action require_current_user!
    def create
        @user= User.new(user_params)
         if @user.save!
            login(@user)
            render json: @user
         else
            flash[:errors]= @user.errors.full_messages
            render :new
         end
    end

    def new
        @user= User.new
        render :new
    end


    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
