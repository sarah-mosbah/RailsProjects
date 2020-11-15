class AlbumsController < ApplicationController

    before_action :require_current_user!
    def create
        @album = Album.new(album_params)
    
        if @album.save
          redirect_to album_url(@album)
        else
          @band = @album.band
          flash.now[:errors] = @album.errors.full_messages
          render :new
        end
      end

    def new
        @band=Band.find(params[:band_id])
        @album=Album.new
        render :new
    end

    def edit
        @band=Band.find(params[:band_id])
        @album=Album.find(params[:id])
        render :edit
    end

    def update
        @album = Album.find(params[:id])
    
        if @album.update(album_params)
          redirect_to album_url(@album)
        else
          flash.now[:errors] = @album.errors.full_messages
          render :edit
        end
      end


      def show
        
        @album=Album.find(params[:id])
        @band=Band.find_by(id: @album.band_id)
        render :show
      end

      private
      def album_params
        params.require(:album).permit(:band_id, :live, :title, :year)
      end
end
