require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'Tonny', email: 'tonnytei4@gmail.com', password: 'Danger123', password_confirmation: 'Danger123')
    @food = Food.new(name:'Ugali', quantity:5, measurment_unit: 10, price:15, user_id:@user.id)
  end

  it 'should have valid attributes' do
    expect(@food).to be_valid
  end

  it 'should have a name' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'Should have measurement_unit' do
    @food.measurment_unit = nil
    expect(@food).to_not be_valid
  end

  it 'Should have a price' do
    @food.price = nil
    expect(@food).to_not be_valid
  end
end