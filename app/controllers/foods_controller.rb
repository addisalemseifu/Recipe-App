class FoodsController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_food, except: %i[index new create]
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food.update(food_params)
    if @food.update(food_params)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to root_path
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
