class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :measurment_unit, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
