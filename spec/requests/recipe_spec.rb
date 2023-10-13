require 'rails_helper'

RSpec.describe '/recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create(name: 'Tonny', email: 'tonnytei4@example.com', password: 'Danger123',
                        password_confirmation: 'Danger123')
    sign_in @user
  end

  after do
    Recipe.where(user: @user).destroy_all if @user.recipes.any?
    @user.destroy
  end

  let(:valid_attributes) do
    { name: 'Recip1', preparation_time: 10, description: 'Ree1', cooking_time: 10, public: true, user: @user }
  end

  let(:invalid_attributes) do
    { name: 'recipe2' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Recipe.create! valid_attributes
      get recipes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      recipe = Recipe.create! valid_attributes
      get recipe_url(recipe)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_recipe_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with invalid parameters' do
      it 'does not create a new Recipe' do
        expect do
          post recipes_url, params: { recipe: invalid_attributes }
        end.to change(Recipe, :count).by(0)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested recipe' do
      recipe = Recipe.create! valid_attributes
      expect do
        delete recipe_url(recipe)
      end.to change(Recipe, :count).by(-1)
    end

    it 'redirects to the recipes list' do
      recipe = Recipe.create! valid_attributes
      delete recipe_url(recipe)
      expect(response).to redirect_to(recipes_url)
    end
  end
end
