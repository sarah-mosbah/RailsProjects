class UsersController < ApplicationController
    before_action :require_current_user!, except: [:new, :create]
    def create
       @user= User.new(user_params)
        if @user.save
           
            login(@user)
            redirect_to user_path(@user)
        else
            flash.now[:errors]= @user.errors.full_messages
            render :new
        end
    end

    def new
        @user= User.new
        render :new
    end


    def show
      @user= User.find(params[:id])
      user_token= User.find_by(session_token: session[:session_token])
       if @user!= user_token
        redirect_to user_path(user_token)
        return
       end

       redirect_to bands_path
    end


    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
