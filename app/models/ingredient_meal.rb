class IngredientMeal < ActiveRecord::Base
  attr_accessible :ingredient_id, :meal_id, :servings
  
  belongs_to :meal
  belongs_to :ingredient
end
