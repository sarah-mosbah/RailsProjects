class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :login]

  before_action :already_signed
  def new
    render :new
  end

  def create
  end

  def login
    @user= User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:id]=@user.id
      redirect_to new_user_path
    else
          puts "hello world"
    end

  end

  private
  def user_params
      puts params.require(:user)
      params.require(:user).permit(:username, :password)
  end
end