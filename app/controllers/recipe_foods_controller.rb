class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe_food, except: %i[index new create]
  def index
    @recipe_food = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id].to_i
    if @recipe_food.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to root_path
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
  end

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
