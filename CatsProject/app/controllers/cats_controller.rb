class CatsController < ApplicationController
    def index
        @cats= Cat.all
        render :index
    end

    def show
        @cat= Cat.find(params[:id])
        @rents= CatRentalRequest.select(:start_date, :end_date).where(cat_id: @cat.id).order(:start_date)
        render :show
    end

    def new
     @cat=Cat.new
     render :new
    end

    def create
     @cat=Cat.new(cats_param)
     puts @cat
      if @cat.save
          redirect_to cat_url(@cat)
      else
        redirect_to '/cats/new'
      end
    end

    def edit
        @cat=Cat.find(params[:id])
        render :edit
    end
    
    def update
        @cat=Cat.find(params[:id])
        if @cat.update_attributes(cats_param)
            redirect_to cat_url(@cat)
        else
            render :edit
        end
    end

    def destroy
     cat=Cat.find(params[:id])
     cat.destroy
    redirect_to cats_url
    end

    def cats_param
        params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
    end
end