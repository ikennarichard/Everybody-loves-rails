require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/:user_id/:posts'
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      get '/users/:user_id/:posts'
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder text' do
      get '/users/:user_id/:posts'
      expect(response.body).to include("Posts")
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:user_id/:posts/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      get '/users/:user_id/:posts/:id'
      expect(response.body).to include("Post title")
    end

    it 'should render the correct template' do
      get '/users/:user_id/:posts/:id'
      expect(response).to render_template('show')
    end
  end
end
