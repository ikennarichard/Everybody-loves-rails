module Api
  module V1
    class PostsController < Api::ApiApplicationController
      def index
        @posts = Post.all
        render json: @posts
      end
    end
  end
end
