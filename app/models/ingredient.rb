class Ingredient < ApplicationRecord
has_many :recipe_ingredients
has_many :recipes, through: :recipe_ingredients

validates :name, presence: true
validates :cost, presence: true

  def self.order_by_name
    order(:name)
  end

end
