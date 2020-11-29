class CommentsController < ApplicationController

  def create
    
    @comment=Comment.new(comment_params)
    @comment.author_id= current_user.id

    if @comment.save
      if @comment.parent_comment_id
         redirect_to show_comment_path(@comment)
      else
        redirect_to post_path(@comment.post)
      end
    else
      flash[:errors]=@comment.errors.full_messages
      redirect_to post_path(@comment.post)
    end
  end

  def show
    comment= Comment.find_by(id: params[:id])
    if comment.has_parent?
      @comment=Comment.find_by(id:comment.parent_comment_id)
    
    else
      @comment= comment
    end
    @new_comment=Comment.new
    @new_comment.parent_comment_id= @comment.id
    render :show

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
    params.require(:comment).permit(:content, :author_id, :post_id, :parent_comment_id)
  end

end
