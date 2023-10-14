require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Tonny', email: 'tonnytei4@gmail.com', password: 'Danger123',
                        password_confirmation: 'Danger123')
  end

  it 'valid user with valid attributes' do
    expect(@user).to be_valid
  end

  it 'invalid user without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'invalid user without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'invalid user without a password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'password confirmation that does not match' do
    @user.password_confirmation = '123Danger'
    expect(@user).to_not be_valid
  end

  it 'is not valid with a password shorter than 6 characters' do
    @user.password = '12345'
    expect(@user).to_not be_valid
  end
end
