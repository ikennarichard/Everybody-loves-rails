class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    return if @post.likes.exists?(author: current_user)
    @like = @post.likes.build(author: current_user)
    
    if @like.save
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end
end
