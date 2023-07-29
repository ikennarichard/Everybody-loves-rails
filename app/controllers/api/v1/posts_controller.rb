class Api::V1::PostsController < Api::ApiApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end
end
