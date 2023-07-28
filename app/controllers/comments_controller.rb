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

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :delete, @comment
    if @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
      redirect_to posts_path
    else
      flash[:notice] = 'Error, deleting comment, Try again'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
