class Ingredient < ActiveRecord::Base
  attr_accessible :calories, :carbs, :name, :price, :protein, :serving_size, :servings
end
