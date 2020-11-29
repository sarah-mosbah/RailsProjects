class PostsController < ApplicationController
  before_action :require_user_owns_post!, only: [:edit, :update]
  def new
    @post = Post.new
  end

  def create
    @post= Post.new(post_params)
    @post.author_id=current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment= Comment.new
    @comments=@post.comments.where(parent_comment_id: nil)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end
 

  private
  def post_params
    params.require(:post).permit(:content, :url, :author_id, :title, sub_ids:[])
  end


  def require_user_owns_post!
    return if current_user.posts.find_by(id: params[:id])
    render json: 'Forbidden', status: :forbidden
  end
end
