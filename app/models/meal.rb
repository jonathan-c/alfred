class Meal < ActiveRecord::Base
  attr_accessible :name, :description, :clean_up, :homemade, :prep_time, :user_id, :status_id
  
  belongs_to :user
  belongs_to :status
  has_many   :meal_statuses 
  has_many   :ingredient_meals
  has_many   :ingredients, :through => :ingredient_meals
  
  validate :name, presence: true, uniqueness: true
  
  def nutrition_total(type)
    ingredient_meals = IngredientMeal.where(meal_id: self.id)
    values = []
    ingredient_meals.each do |i|
      ingredient = Ingredient.find(i.ingredient_id)
      values<<(ingredient.send(type) * i.servings)
    end
    values.inject(:+).round
  end
  
  def calories
    nutrition_total("calories")
  end
  
  def protein
    nutrition_total("protein")
  end
  
  def carbs
    nutrition_total("carbs")
  end
  
  def price
    # calculates the total cost of the meal
    ingredient_meals = IngredientMeal.where(meal_id: self.id)
    values = []
    ingredient_meals.each do |i|
      values<<i.price
    end
    values.inject(:+).round(2)
  end
  
  def ingredients_price_hash
    # Cost of each ingredient used in the meal
    ingredient_meals = IngredientMeal.where(meal_id: self.id)
    ingredients_price_hash = {}
    ingredient_meals.each do |i|
      ingredient = Ingredient.find(i.ingredient_id)
      ingredients_price_hash["#{ingredient.name}"] = i.price.round(2)
    end
    ingredients_price_hash
  end
end
