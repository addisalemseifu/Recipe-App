class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, except: %i[index new create]
  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to @recipe
  end

  # def index
  #     @recipe = Recipe.all
  # end

  # def show
  #     @recipe = Recipe.find(params[:id])
  #     @food = Food.find(params[:id])
  # end

  # def create

  # end
end