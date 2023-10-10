class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods
  has_many :recipes
  has_many :recipe_foods, through: :foods
  has_many :recipe_foods, through: :recipes
  # Validations
  validates :name, presence: true
end
