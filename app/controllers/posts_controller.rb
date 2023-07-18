class PostsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id]) ? return : nil
      @posts = @user.posts
    else
      @posts = Post.all
    end
  rescue ActiveRecord::RecordNotFound
    render 'errors/not_found', status: :not_found
  end

  def show
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'errors/not_found', status: :not_found
  end
end
