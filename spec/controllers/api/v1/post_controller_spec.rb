require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  describe 'GET #index' do
    let(:user) { FactoryBot.create(:user) }
    let(:posts) { FactoryBot.build_list(:post, 5, author: user) }
    
    before { posts.each(&:save!) }

    it 'returns a successful response' do
      get :index, params: { user_id: user.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it 'returns all posts as JSON' do
      get :index, params: { user_id: user.id }, format: :json
      expect(response.content_type).to eq('application/json; charset=utf-8')
      parsed_response = JSON.parse(response.body)

      expect(parsed_response.size).to eq(5)

      parsed_response.each do |post_json|
        post = Post.find(post_json['id'])
        expect(post_json).to include('author_id','title', 'text')
        expect(post_json['id']).to eq(post.id)
        expect(post_json['title']).to eq(post.title)
        expect(post_json['text']).to eq(post.text)
      end
    end
  end
end
