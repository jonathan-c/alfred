class IngredientMeal < ActiveRecord::Base
  attr_accessible :ingredient_id, :meal_id, :servings
  
  belongs_to :meal
  belongs_to :ingredient
  
  def price
    ingredient = Ingredient.find(self.ingredient_id)
    (ingredient.price / ingredient.servings) * self.servings
  end
end
