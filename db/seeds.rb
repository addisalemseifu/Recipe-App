# Users
first_user = User.first


# Food
post_list = [];
1.times do |i|
    puts "post #{i}"
    this_food1 = Food.create(user: first_user, name: 'chicken breast', measurment_unit: "units",price: 10, quantity: 3)
end

1.times do |i|
    puts "post #{i}"
    this_food2 = Food.create(user: first_user, name: 'Apple', measurment_unit: "grams",price: 2, quantity: 10)
end

1.times do |i|
    puts "post #{i}"
    this_recipe1 = Recipe.create(user: first_user, name: 'chicken broast', preparation_time: 3,cooking_time: 2, description: 'This is a test description for the checken broast preparation process.',public: true)
end

1.times do |i|
    puts "post #{i}"
    this_recipe2 = Recipe.create(user: first_user, name: 'pasta with meat balls', preparation_time: 1,cooking_time: 0.5, description: 'This is a test description for the meat ball preparation process.',public: false)
end
1.times do |i|
    puts "post #{i}"
    this_recipe_food1 = RecipeFood.create(recipe: this_recipe1, food: this_food1, quantity: 5)
end

1.times do |i|
    puts "post #{i}"
    this_recipe_food2 = RecipeFood.create(recipe: this_recipe2, food: this_food2, quantity: 10)
end

