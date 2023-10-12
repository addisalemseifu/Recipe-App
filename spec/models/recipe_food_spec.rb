require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    RecipeFood.new(
      quantity: 5,
      recipe: Recipe.first,
      food: Food.first
    )
  end
  before { subject.save }
  describe 'checking if recipe_food is validity' do
    it 'should have a valid attribute' do
      expect(subject).to_not be_valid
    end
  end

  describe 'checking if recipe_food is not valid' do
    it 'quantity should be not be a string' do
      subject.quantity = '-5'
      expect(subject).to_not be_valid
    end
  end
end
