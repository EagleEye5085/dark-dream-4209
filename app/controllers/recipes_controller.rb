class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order_by_name
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @cost = Recipe.find(params[:id]).total_cost(params[:id])
  end

end
