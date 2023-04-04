require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'Test Users Controller' do
    it 'Should return 200 reponse for user#index route' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'Should render render index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'Should return correct placeholder text' do
      get '/users/'
      expect(response.body).to include('Lise of users with number of their posts')
    end
  end
end
