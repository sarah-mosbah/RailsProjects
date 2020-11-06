class CommentsController < ApplicationController
    def create
        comment= Comment.new(comments_params)

        if comment.save
            render json: comment
        else
            render(
                json: comment.errors.full_messages,
                status: :unprocessable_entity)
        end
    end

    def index
       render json: Comment.all
    end

    def destroy
        comment=Comment.find(params[:id])
        comment.destroy
        render json: comment
    end

    def comments_params
        params.require(:comment).permit(:artwork_id,:user_id,:body)
    end
end