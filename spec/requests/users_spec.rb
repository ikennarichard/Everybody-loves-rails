require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      get '/users/'
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder text' do
      get '/users/'
      expect(response.body).to include('Users recent posts')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      get '/users/:id'
      expect(response.body).to include('display user info')
    end

    it 'should render the correct template' do
      get '/users/:id'
      expect(response).to render_template('show')
    end
  end
end
