require 'rails_helper'

RSpec.describe "Users", type: :request do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create(name: "Tonny", email: 'tonnytei4@example.com', password: 'Danger123', password_confirmation: "Danger123")
    sign_in @user
  end

  after do
    @user.destroy
    User.destroy_all
  end

  let(:valid_attributes) do
    { name: 'User', email: 'donmiller4@example.com', password: 'Smart123', password_confirmation: "Smart123"}
  end

  let(:invalid_attributes) do
    { name: nil, email: nil }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      User.create! valid_attributes
      get root_path
      expect(response).to be_successful
    end
  end
end
