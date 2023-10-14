require 'rails_helper'

RSpec.feature 'New Food', type: :feature do
  let(:user) { User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'addisalem') }

  before do
    login_as(user, scope: :user)
    visit new_recipe_path
  end

  scenario 'User views the new recipe form' do
    expect(page).to have_content('Happy Cooking')

    expect(page).to have_css('form')
    expect(page).to have_field('Name', type: 'text')
    expect(page).to have_field('Preparation time', type: 'text')
    expect(page).to have_field('Cooking time', type: 'text')
    expect(page).to have_field('Description', type: 'text')
    expect(page).to have_field('Public', type: 'text')
    expect(page).to have_button('Create Recipe')
  end

  scenario 'User creates a new Recipe' do
    fill_in 'Name', with: 'New Test Recipe'
    fill_in 'Preparation time', with: 2
    fill_in 'Cooking time', with: 1
    fill_in 'Description', with: 'Test dis'
    fill_in 'Public', with: true

    click_button 'Create Recipe'

    expect(page).to have_current_path(recipes_path)
    visit recipes_path
    expect(page).to have_content('New Test Recipe')
  end
end
