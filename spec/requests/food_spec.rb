require 'rails_helper'

RSpec.describe '/foods', type: :request do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Tonny', email: 'tonnytei4@example.com', password: 'Danger123',
                        password_confirmation: 'Danger123')
    sign_in @user
  end
  let(:valid_attributes) do
    { name: 'Example Food', measurment_unit: 5, price: 10, quantity: 4 }
  end

  let(:invalid_attributes) do
    { name: nil, measurment_unit: 10, price: '210', quantity: 4 }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get foods_url, headers: { 'HOST' => 'localhost:3000' }
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_food_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with invalid parameters' do
      it 'does not create a new Food' do
        expect do
          post foods_url, params: { food: invalid_attributes }
        end.to change(Food, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post foods_url, params: { food: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys a food record and redirects to root_path' do
      food = Food.create! valid_attributes.merge(user: @user)

      expect do
        delete food_path(food)
      end.to change(Food, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end
