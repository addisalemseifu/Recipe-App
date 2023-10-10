class FoodsController < ApplicationController
  before_action :set_food, except: %i[index new create]
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurment_unit, :price, :quantity)
  end

  def set_food
    @food = Food.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
