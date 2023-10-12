require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user1 = User.create(name: 'Tonny', email: 'tonnytei4@gmail.com', password: 'Danger123',
                         password_confirmation: 'Danger123')
    @recipe1 = Recipe.create(name: 'Milk juice', preparation_time: 2, cooking_time: 3,
                             description: 'Milk that tastes good', public: true, user_id: @user1.id)
  end
  it 'Should have valid attributes' do
    expect(@recipe1).to be_valid
  end

  it 'Should have a name' do
    @recipe1.name = nil
    expect(@recipe1).to_not be_valid
  end

  it 'Should have a preparaion time' do
    @recipe1.preparation_time = nil
    expect(@recipe1).to_not be_valid
  end

  it 'Should have a cooking time' do
    @recipe1.cooking_time = nil
    expect(@recipe1).to_not be_valid
  end

  it 'Should have a description' do
    @recipe1.description = nil
    expect(@recipe1).to_not be_valid
  end

  it 'Preparation time should be a string' do
    @recipe1.preparation_time = 2
    expect(@recipe1).to be_valid
  end

  it 'Should have a cooking time as an interger' do
    @recipe1.cooking_time = 2
    expect(@recipe1).to be_valid
  end

  it 'Should have a user' do
    @recipe1.user_id = nil
    expect(@recipe1).to_not be_valid
  end
end
