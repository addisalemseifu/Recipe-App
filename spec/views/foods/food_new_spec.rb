require 'rails_helper'

RSpec.feature 'New Food', type: :feature do
  let(:user) { User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'addisalem') }

  before do
    login_as(user, scope: :user)
    visit new_food_path
  end

  scenario 'User views the new food form' do
    expect(page).to have_content('Happy Cooking')

    expect(page).to have_css('form')
    expect(page).to have_field('Name', type: 'text')
    expect(page).to have_field('Measurment unit', type: 'text')
    expect(page).to have_field('Price', type: 'text')
    expect(page).to have_field('Quantity', type: 'text')
    expect(page).to have_button('Create Food')
  end

  scenario 'User creates a new food' do
    fill_in 'Name', with: 'New Test Food'
    fill_in 'Measurment unit', with: 'kg'
    fill_in 'Price', with: 15
    fill_in 'Quantity', with: 10

    click_button 'Create Food'

    expect(page).to have_current_path(root_path)
    visit root_path
    expect(page).to have_content('New Test Food')
  end
end
