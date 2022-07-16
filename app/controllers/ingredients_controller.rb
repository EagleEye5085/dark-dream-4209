class IngredientsController < ApplicationController

  def index
    # binding.pry
    @ingredients = Ingredient.all.order_by_name
  end

end
