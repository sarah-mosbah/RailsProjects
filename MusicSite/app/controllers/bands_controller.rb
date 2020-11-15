class BandsController < ApplicationController
    before_action :require_current_user!

    def index
        @bands= Band.all
        render :index
    end


    def create
        @band = Band.new(band_params)

        if @band.save
        redirect_to band_url(@band)
        else
          flash.now[:errors] = @band.errors.full_messages
          render :new
        end
    end

    def update
        @band= Band.find(params[:id])
        if @band.nil?
            redirect_to bands_path
            
        elsif @band.update(band_params)
            redirect_to band_url(@band)
        else
            flash[:errors]= @band.errors.full_messages
            render :edit
        end
      
    end

    def show
        @band= Band.find(params[:id]) 
        render :show
    end

    def new
        @band=Band.new
        render :new
    end

    def edit
        @band= Band.find(params[:id]) 
        render :edit
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end


end
