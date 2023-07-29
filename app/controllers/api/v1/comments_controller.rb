module Api
  module V1
    class CommentsController < Api::ApiApplicationController
      before_action :set_post
      
      def index
        @comments = @post.comments
        render json: @comments
      end
    
      def create
        @comment = @post.comments.build(comment_params)
        @comment.author_id = current_user&.id || comment_params[:author_id].
    
        if @comment.save
          render json: @comment, status: :created
        else
          render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = "Post not found."
      end
    
      private
    
      def comment_params
        params.require(:comment).permit(:text, :author_id)
      end
    
      def set_post
        @post = Post.find(params[:post_id])
      end
    end
  end
end


