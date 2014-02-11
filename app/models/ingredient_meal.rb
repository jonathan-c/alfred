class IngredientMeal < ActiveRecord::Base
  self.primary_key = [:ingredient_id, :meal_id, :servings]
  attr_accessible :ingredient_id, :meal_id, :servings
  
  belongs_to :meal
  belongs_to :ingredient
  
  validates :servings, presence: true
  
  def price
    ingredient = Ingredient.find(self.ingredient_id)
    (ingredient.price / ingredient.servings) * self.servings
  end
end
