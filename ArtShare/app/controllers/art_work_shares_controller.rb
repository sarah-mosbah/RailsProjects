class ArtWorkSharesController < ApplicationController


    def create
        share = ArtWorkShare.new(artworkshare_params)

    if share.save
      render json: share, status: :created
    else
      render(
        json: share.errors.full_messages,
        status: :unprocessable_entity
      )
    end
    end


    def destroy
        share=ArtWorkShare.find(params[:id])
        share.destroy
        render json:share
    end

    
    def artworkshare_params
        params.require(:art_work_share).permit(:artwork_id, :viewer_id)
    end




end