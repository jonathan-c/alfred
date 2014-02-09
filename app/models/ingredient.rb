class Ingredient < ActiveRecord::Base
  attr_accessible :calories, :carbs, :name, :price, :protein, :serving_size, :servings
  
  has_many :ingredient_meals
  has_many :meals, :through => :ingredient_meals
end
