require 'rails_helper'

RSpec.describe 'recipe show page' do
  before :each do
    @recipe_1 = Recipe.create!(name: 'B.L.T.', complexity: 1, genre: "American")

    ingredient_1 = Ingredient.create(name: 'bread', cost: 2)
    ingredient_2 = Ingredient.create(name: 'bacon', cost: 3)
    ingredient_3 = Ingredient.create(name: 'lettuce', cost: 1)
    ingredient_4 = Ingredient.create(name: 'tomato', cost: 1)
    ingredient_5 = Ingredient.create(name: 'mayo', cost: 1)

    RecipeIngredient.create!(recipe_id: @recipe_1.id,
    ingredient_id: ingredient_1.id)
    RecipeIngredient.create!(recipe_id: @recipe_1.id,
    ingredient_id: ingredient_2.id)
    RecipeIngredient.create!(recipe_id: @recipe_1.id,
    ingredient_id: ingredient_3.id)
    RecipeIngredient.create!(recipe_id: @recipe_1.id,
    ingredient_id: ingredient_4.id)
    RecipeIngredient.create!(recipe_id: @recipe_1.id,
    ingredient_id: ingredient_5.id)

    visit "/recipes/#{@recipe_1.id}"
  end

  it 'lists all ingredients for a recipe' do

    expect(page).to have_content('B.L.T.')
    expect(page).to have_content('bread')
    expect(page).to have_content('lettuce')
    expect(page).to have_content('bacon')
    expect(page).to have_content('tomato')
    expect(page).to have_content('mayo')
  end

  it 'shows the total cost of all of the ingredients in the recipe' do

    expect(page).to have_content('total cost: 8')
  end
end
