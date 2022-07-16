# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@recipe_2 = Recipe.create!(name: 'B.T.M.', complexity: 1, genre: "American")
@recipe_1 = Recipe.create!(name: 'B.L.T.', complexity: 1, genre: "American")


ingredient_1 = Ingredient.create(name: 'bread', cost: 2)
ingredient_2 = Ingredient.create(name: 'bacon', cost: 3)
ingredient_3 = Ingredient.create(name: 'lettuce', cost: 1)
ingredient_4 = Ingredient.create(name: 'tomato', cost: 1)
ingredient_5 = Ingredient.create(name: 'mayo', cost: 1)

RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: ingredient_1.id)
RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: ingredient_2.id)
RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: ingredient_3.id)
RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: ingredient_4.id)
RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: ingredient_5.id)
RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: ingredient_1.id)
RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: ingredient_2.id)
RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: ingredient_4.id)
RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: ingredient_5.id)
