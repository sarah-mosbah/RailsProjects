class SessionsController < ApplicationController

    def create

        user= User.find_by_credentials(params[:user][:email],params[:user][:password])
        if user.nil?
          flash[:invalid]="Invalid Credentials"
          redirect_to new_session_path
          else
            login(user)

            redirect_to user_path(user)
          end
    end

    def new
        render :new
    end

    def destroy
        logout!
        redirect_to new_session_url
    end


end
