# require 'rails_helper'

# RSpec.describe "Food list", type: :feature do
#   before(:each) do
#     user =  User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'Addisalem')
#     def login(user)
#         visit user_session_path
#         fill_in "Email",    with: user.email
#         fill_in "Password", with: user.password
#         click_button "Log in"
#       end
#       login(user)
#     @food = Food.create(name: "Pizza", measurment_unit: "slice", price: 10)
#   end

#   it "displays a list of foods" do
#     visit "/foods"
#     expect(page).to have_content("Happy Cooking")
#     expect(page).to have_content(@food.name)
#     expect(page).to have_content(@food.measurment_unit)
#     expect(page).to have_content("$" + @food.price.to_s)
#   end

#   it "allows a user to add a new food" do
#     visit "/foods"
#     click_button "Add Food"
#     fill_in "Name", with: "Burger"
#     fill_in "Measurment unit", with: "piece"
#     fill_in "price", with: 5
#     click_button "Create Food"
#     expect(page).to have_content("Burger")
#     expect(page).to have_content("piece")
#     expect(page).to have_content("$5")
#   end

#   it "allows a user to edit an existing food" do
#     visit "/foods"
#     click_button "Edit"
#     fill_in "Name", with: "New Pizza"
#     fill_in "Measurement unit", with: "slice"
#     fill_in "Price", with: 12
#     click_button "Update Food"
#     expect(page).to have_content("New Pizza")
#     expect(page).to have_content("$12")
#   end

#   it "allows a user to delete an existing food" do
#     visit "/foods"
#     click_button "Delete"
#     page.driver.browser.switch_to.alert.accept
#     expect(page).not_to have_content(@food.name)
#   end
# end


require 'rails_helper'

RSpec.feature 'Foods Index Page', type: :feature do
  let(:user) { User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'addisalem') }

  before(:each) do
    login_as(user, scope: :user)
    Food.create(name: 'Rice', measurment_unit: 'kg', price: 10, quantity: 20, user:)
    Food.create(name: 'Chicken', measurment_unit: 'kg', price: 30, quantity: 10, user:)
    Food.create(name: 'Beef', measurment_unit: 'kg', price: 50, quantity: 10, user:)
    visit foods_path
  end
  scenario 'User views their Food list on index' do
    expect(page).to have_content('Rice')
    expect(page).to have_content('Chicken')
  end

  scenario 'User views delete Food button on index' do
    foods = Food.where(user:)
    foods.each do |_food|
      expect(page).to have_content('Delete')
    end
  end
  scenario 'User views Edit Food button on index' do
    foods = Food.where(user:)
    foods.each do |_food|
      expect(page).to have_content('Edit')
    end
  end
  scenario 'User clicks on a New Food and is redirected to their New Food page' do
    first('a', text: 'Add Food').click
    expect(page).to have_current_path(new_food_path)
  end
end
