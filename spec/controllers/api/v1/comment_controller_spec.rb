require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  describe 'GET #index' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post, author: user) }
    let(:comments) { FactoryBot.build_list(:comment, 5, author: user, post:) }

    before { comments.each(&:save!) }

    it 'returns a successful response' do
      get :index, params: { user_id: user.id, post_id: post.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it 'returns all posts as JSON' do
      get :index, params: { user_id: user.id, post_id: post.id }, format: :json
      expect(response.content_type).to eq('application/json; charset=utf-8')
      parsed_response = JSON.parse(response.body)

      expect(parsed_response.size).to eq(5)

      parsed_response.each do |comment_json|
        comment = Comment.find(comment_json['id'])
        expect(comment_json).to include('author_id', 'post_id', 'text')
        expect(comment_json['post_id']).to eq(post.id)
      end
    end
  end

  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }
    let(:post1) { FactoryBot.create(:post) }


    it 'creates a comment for the post and associates it with the current user' do
      comment_params = { text: 'This is a test comment.', author_id: user.id }

      post :create, params: { author_id: user.id, post_id: post1.id, comment: comment_params }, format: :json

      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq('application/json; charset=utf-8')


      comment = Comment.last
      expect(comment.text).to eq('This is a test comment.')
    end
  end
end
