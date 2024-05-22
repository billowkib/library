require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it 'renders user form' do
      get '/users/new'
      expect(response).to render_template(:new)
    end
  end

  describe "POST /create" do
    it 'creates a member' do
      post '/users', params: { user: attributes_for(:user, :member) }
      expect(response).to have_http_status(:created)
    end
  end
end
