class SubsController < ApplicationController
    before_action :check_current_user, only:[:edit, :update]
    def index
        @subs= Sub.all
        render :index
    end


    def create
        @sub = Sub.new(sub_params)
         @sub.user_id=session[:id]
        if @sub.save
        redirect_to sub_url(@sub)
        else
          flash.now[:errors] = @sub.errors.full_messages
          render :new
        end
    end

    def update
        @sub= Sub.find(params[:id])
        if @sub.nil?
            redirect_to subs_path
            
        elsif @sub.update(sub_params)
            @sub.user_id= current_user.id
            redirect_to sub_url(@sub)
        else
            flash[:errors]= @sub.errors.full_messages
            render :edit
        end
      
    end

    def show
        @sub= Sub.find(params[:id]) 
        @posts=@sub.posts
        render :show
    end

    def new
        @sub=Sub.new
        render :new
    end

    def edit
        @sub= Sub.find(params[:id]) 
        render :edit
    end



    private
    def sub_params
        params.require(:sub).permit(:title,:user_id, :description)
    end

    def check_current_user
    sub= Sub.find(params[:id])
     redirect_to subs_path   if sub.user_id!= current_user.id
    end

end
