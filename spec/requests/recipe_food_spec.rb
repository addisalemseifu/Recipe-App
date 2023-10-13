require 'rails_helper'

RSpec.describe '/recipe_foods', type: :request do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create(name: 'Tonny', email: 'tonnytei4@example.com', password: 'Danger123',
                        password_confirmation: 'Danger123')

    @food = Food.create(name: 'Potato', price: 10, measurment_unit: 5, quantity: 6, user:@user)

    @recipe = Recipe.create(name: 'Recipe1', user: @user, preparation_time: 10, description: 'Rece1', cooking_time: 10,
                            public: true)
    sign_in @user
  end

  after do
    @food.destroy
    @recipe.destroy
    @user.destroy
  end

  let(:valid_attributes) do
    { recipe: @recipe, food: @food, quantity: 10 }
  end

  let(:invalid_attributes) do
    { recipe: @recipe, food: nil, quantity: nil }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      RecipeFood.create! valid_attributes
      get recipe_recipe_foods_url(@recipe)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
        it 'renders a successful response' do
          recipe_food = RecipeFood.create! valid_attributes
          get recipe_recipe_foods_url(recipe_food)
          expect(response).to be_successful
        end
      end

      describe 'GET /new' do
        it 'renders a successful response' do
          get new_recipe_recipe_food_url(@recipe)
          expect(response).to be_successful
        end
      end

      describe 'GET /edit' do
        it 'renders a successful response' do
          recipe_food = RecipeFood.create! valid_attributes
          get edit_recipe_recipe_food_url(recipe_id: recipe_food.recipe_id, id: recipe_food.id)
          expect(response).to be_successful
        end
      end

    describe 'POST /create' do
        context 'with invalid parameters' do
          it "renders a response with 422 status (i.e. to display the 'new' template)" do
            post recipe_recipe_foods_url(@recipe), params: { recipe_food: invalid_attributes }
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
    end

    describe 'PATCH /update' do
        context 'with valid parameters' do
            let(:new_attributes) do
                { recipe: @recipe, food: @food, quantity: 20 }
            end

            it 'updates the requested recipe_food' do
                recipe_food = RecipeFood.create! valid_attributes
                patch recipe_recipe_food_url(@recipe, recipe_food), params: { recipe_food: new_attributes }
                recipe_food.reload
            end
        end
    end
end