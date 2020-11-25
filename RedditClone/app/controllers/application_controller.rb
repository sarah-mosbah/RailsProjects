class ApplicationController < ActionController::Base

    before_action :authorized
    before_action :set_no_cache
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        if session[:id]
        User.find(session[:id])
        else
            nil
        end
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

    def set_no_cache
        response.headers['Cache-Control'] = 'no-cache, no-store,
                                            max-age=0, must-revalidate'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
      end
end
