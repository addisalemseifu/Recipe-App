require 'rails_helper'

RSpec.describe "UserRegistrations", type: :request do
  describe "GET /users/sign_up" do
    it "renders the registration form" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "creates a new user" do
      post user_registration_path, params: {
        user: {
          name: "User",
          email: "user@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response).to have_http_status(200)
    end

    it "fails to create a user with invalid data" do
      post user_registration_path, params: {
        user: {
          name: "User",
          email: "user@example.com",
          password: "password123",
          password_confirmation: "different_password"
        }
      }
      
      expect(response).to have_http_status(422)
    end
  end
end
