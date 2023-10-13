require 'rails_helper'

RSpec.describe "UserLogins", type: :request do
  include Devise::Test::IntegrationHelpers 
  before :each do
    @user = User.create(name: "User", email: 'user@example.com', password: 'password123', password_confirmation: "password123")
  end

  it 'allows a registered user to log in' do
    sign_in @user 
    get root_path
    expect(response).to be_successful
  end

  it 'does not allow an unregistered user to log in' do
    post user_session_path, params: { user: { email: 'nonexistent@example.com', password: 'invalidpassword' } }

    expect(response).to have_http_status(:unprocessable_entity)
    expect(response.body).to include('Invalid Email or password')
  end
end
