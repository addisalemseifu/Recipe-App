class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    # return unless user.present?
    # can :read, :all
    # return unless user.admin?
    # can :manage, :all
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
      can :create, Food
      can :create, Recipe
      can :read, :all
    end
  end
end
