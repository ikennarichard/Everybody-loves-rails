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
      expect(response.body).to include('Everybody Loves Rails')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1'
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      get '/users/1'
      expect(response.body).to include('User info')
    end

    it 'should render the correct template' do
      get '/users/1'
      expect(response).to render_template('show')
    end
  end
end
