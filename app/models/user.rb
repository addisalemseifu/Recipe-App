class User < ApplicationRecord
  has_many :foods
  has_many :recipes

  # Validations
  validates :name, presence: true
end
