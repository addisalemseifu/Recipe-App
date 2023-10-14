class Ability
  include CanCan::Ability

  def initialize(user) # rubocop:disable Metrics/MethodLength
    user ||= User.new
    if can :update, Food do |food|
         food.user == user
       end
      can :destroy, Food do |food|
        food.user == user
      end
      can :update, Recipe do |recipe|
        recipe.user == user
      end
      can :destroy, Recipe do |recipe|
        recipe.user == user
      end
      can :update, RecipeFood do |rf|
        rf.recipe.user == user
      end
      can :destroy, RecipeFood do |recipe_food|
        recipe_food.recipe.user == user
      end

      can :create, Food
      can :create, Recipe
      can :create, RecipeFood
      can :read, :all
    end
  end
end
