class ApplicationController < ActionController::Base

    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        User.find(session[:id])
    end

    def logged_in?
        !current_user.nil?
    end

    def authorized
     redirect_to new_session_path unless logged_in?
    end

    def already_signed
      redirect_to '/'  if session[:id]
    end
end
