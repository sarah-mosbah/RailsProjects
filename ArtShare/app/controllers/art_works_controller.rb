class ArtWorksController < ApplicationController


    def index
      render json: ArtWork.get_artwork_for_user( params[:user_id])
    end

    def create
     
      art=ArtWork.new(artwork_params)
      if art.save
        render json: art
      else
        raise art.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      render json: ArtWork.find(params[:id])
    end
    
    def update
      art= ArtWork.find(params[:id])

      if art.update_attributes(artwork_params)
        render json: art
      else
        raise art.errors.full_messages, status: :unprocessable_entity
      end
      
    end

    def destroy
       art= ArtWork.find(params[:id])
       art.destroy
       render json: art

    end

    def artwork_params
        params.require(:art_work).permit(:image_url,:title,:artist_id)
    end
    
end