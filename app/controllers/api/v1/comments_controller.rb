class Api::V1::CommentsController < ApplicationController
  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Post not found.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
