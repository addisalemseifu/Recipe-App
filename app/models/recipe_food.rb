class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  # Validations
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
