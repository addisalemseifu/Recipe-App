class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods


  # Validations
  validates :name, presence: true
  validates :measurment_unit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
