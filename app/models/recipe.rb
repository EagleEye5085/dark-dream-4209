class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  validates :complexity, presence: true
  validates :genre, presence: true

  def self.order_by_name
    order(:name)
  end

  def total_cost(id)
    Recipe.find(id).ingredients.map do |ingredient|
      ingredient.cost
    end.sum
  end
end
