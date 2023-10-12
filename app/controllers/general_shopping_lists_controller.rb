class GeneralShoppingListsController < ApplicationController
  def index
    if user_signed_in?
      @foods = Food.joins(:recipe_foods)
        .where(foods: { user_id: current_user.id })
        .where('foods.quantity < recipe_foods.quantity')
        .distinct
      @food_lists = @foods.map do |food|
        {
          name: food.name,
          measurment_unit: food.measurment_unit,
          quantity: food.quantity,
          total_quantity: food.recipe_foods.sum(:quantity) - food.quantity,
          price: (food.recipe_foods.sum(:quantity) - food.quantity) * food.price
        }
      end
      @total_price = total_price_of_missing_food(@food_lists)
    else
      redirect_to new_user_session_path
    end
  end

  private

  def total_price_of_missing_food(food_list)
    total_price = 0
    food_list.each do |food|
      total_price += food[:price]
    end
    total_price
  end
end
