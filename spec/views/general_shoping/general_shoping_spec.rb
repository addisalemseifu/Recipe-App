require 'rails_helper'

RSpec.feature 'General Shoping', type: :feature do
  let(:user) { User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'addisalem') }
  let!(:food1) { Food.create(name: 'Rice', measurment_unit: 'kg', price: 15, quantity: -3, user:) }
  let!(:food2) { Food.create(name: 'Beef', measurment_unit: 'kg', price: 100, quantity: -10, user:) }
  let!(:foods) { [food1, food2] }

  before do
    login_as(user, scope: :user)
    visit general_shopping_lists_path
  end

  scenario 'User views the General Shoping page' do
    expect(page).to have_content('Amount of food items to buy:')
    expect(page).to have_content('Total value of food needed:')
    expect(page).to have_css('table')
  end
end
