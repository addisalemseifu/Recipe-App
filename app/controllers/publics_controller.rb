class PublicsController < ApplicationController
  def index
    @users = User.all
    @public_recipes = Recipe.includes(%i[recipe_foods user]).where(public: true).order(created_at: :desc)
  end

  # def update
  #   @recipe = Recipe.find(params[:id])
  #   @recipe.toggle(:public).save
  # end
end
