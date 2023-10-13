class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show toggle]
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
      redirect_to recipes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipe_foods = @recipe.recipe_foods
  rescue ActiveRecord::RecordNotFound
    redirect_to recipes_path
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  def update
    @recipe.toggle(:public).save
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def recipe_update
    @recipe.update(recipe_params)
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :new, status: :unprocessable_entity
    end
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
end
