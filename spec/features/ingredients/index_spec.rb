require 'rails_helper'

RSpec.describe 'ingredients index page' do
  before :each do
    @recipe_1 = Recipe.create!(name: 'B.L.T.', complexity: 1, genre: "American")
    @recipe_2 = Recipe.create!(name: 'B.T.M.', complexity: 1, genre: "American")

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

  end

  it 'list of ingredients and the number of recipes each ingredient is used in' do
    visit '/ingredients'

    expect(page).to have_content('bread')
    expect(page).to have_content('used in 2 recipes')
    expect(page).to have_content('lettuce')
    expect(page).to have_content('used in 1 recipes')
    expect(page).to have_content('bacon')
    expect(page).to have_content('tomato')
    expect(page).to have_content('mayo')
  end

  it 'orders by title' do

    visit '/ingredients'

    within '#ingredient-0' do
      expect(page).to have_content("bacon")
    end

    within '#ingredient-1' do
      expect(page).to have_content("bread")
    end

    within '#ingredient-2' do
      expect(page).to have_content("lettuce")
    end
  end

end
