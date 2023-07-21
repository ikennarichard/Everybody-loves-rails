class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
