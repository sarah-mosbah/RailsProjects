class CommentsController < ApplicationController

  def create
    @comment=Comment.new(comment_params)
    @comment.author_id= current_user.id

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      flash[:errors]=@comment.errors.full_messages
      redirect_to post_path(@comment.post)
    end
  end

  def update
  end

  def destroy
    @comment= Comment.find_by(id: params[:id])
    if @comment
      @comment.destroy
    end
    
    redirect_to post_url(@comment.post)
  end


  private 

  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id)
  end
end
