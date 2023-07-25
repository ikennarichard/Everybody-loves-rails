require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to be_successful
    end

    it 'should render the correct template' do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('User posts')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      get '/users/1/posts/1'
      expect(response.body).to include('Post')
    end

    it 'should render the correct template' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end
  end
end
