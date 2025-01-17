require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  it 'can get a total cost' do
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

    expect(@recipe_1.total_cost(@recipe_1.id)).to eq(8)
  end

end
