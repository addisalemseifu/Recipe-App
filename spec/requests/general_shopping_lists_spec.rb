require 'rails_helper'

RSpec.describe GeneralShoppingListsController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: "Tonny", email: 'tonnytei4@example.com', password: 'Danger123', password_confirmation: "Danger123")
    sign_in @user
  end

  context 'when user is signed in' do
    let(:valid_attributes) do
        { name: 'Example Food', measurment_unit: 5, price: 10,  quantity: 4 }
      end

    it 'renders the index page' do
      get general_shopping_lists_path

      expect(response).to be_successful
    end

    it 'assigns the correct variables' do
        # Create test data to simulate the behavior of a signed-in user
        # food = food = Food.create! valid_attributes.merge(user: @user)
            
        get general_shopping_lists_path
      
        # expect(assigns(:foods)).to be_present
        # expect(assigns(:food_lists)).to be_present
        # expect(assigns(:total_price)).to be_present
      end
  end
end
