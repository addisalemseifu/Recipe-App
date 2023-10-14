class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  # Validations
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def user_recipes
    current_user.recipe_foods.group_by { |h| h[:food_id] }.reduce([]) do |acc, (food_id, hashes)|
      acc << { food_id:, quantity: hashes.sum { |h| h[:quantity] } }
    end
  end
end
