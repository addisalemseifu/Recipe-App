require 'rails_helper'

RSpec.feature 'Foods Index Page', type: :feature do
  let(:user) { User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'addisalem') }

  before(:each) do
    login_as(user, scope: :user)
    Recipe.create(name: 'chicken broast', preparation_time: 3, cooking_time: 2,
                  description: 'This is a test.', public: true, user:)
    Recipe.create(name: 'pasta with meat balls', preparation_time: 1, cooking_time: 0.5,
                  description: 'This is a test.', public: false, user:)
    visit recipes_path
  end

  scenario 'User views delete Recipe button on index' do
    recipe = Recipe.where(user:)
    recipe.each do |_recipe|
      expect(page).to have_content('Remove')
    end
  end
  scenario 'User views Edit Food button on index' do
    recipe = Recipe.where(user:)
    recipe.each do |_recipe|
      expect(page).to have_content('Edit')
    end
  end
  scenario 'User views Add Recipe button on index' do
    Recipe.where(user:)
    expect(page).to have_content('Add Recipe')
  end
  scenario 'User clicks on a Add Recipe and is redirected to their New Food page' do
    first('a', text: 'Add Recipe').click
    expect(page).to have_current_path(new_recipe_path)
  end
end
