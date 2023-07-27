class PostsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'errors/not_found', status: :not_found
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :delete, @post
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to user_posts_path(@post.author)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
