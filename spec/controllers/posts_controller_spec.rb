require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'Test posts controller' do
    it 'Should Return a successfull response' do
      get '/users/:id/posts/'
      expect(response).to be_successful
    end

    it 'Should render correct template(view)' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'Should return the correct placeholder for post' do
      get '/users/:id/posts'
      expect(response.body).to include('Users Post')
    end

    it 'Should response success response for post show method' do
      get '/users/:id/posts/:id'
      expect(response).to be_successful
    end

    it 'Should render show view for user post' do
      get '/users/:id/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'Should return the correct placeholder for post#show' do
      get '/users/:id/posts/:id'
      expect(response.body).to include('Detail for post')
    end
  end
end
