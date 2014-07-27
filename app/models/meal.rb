class Meal < ActiveRecord::Base
  attr_accessible :name, :clean_up, :homemade, :prep_time, :user_id, :status_id, :category_id

  belongs_to :user
  belongs_to :status
  belongs_to :category
  has_many   :meal_statuses
  has_many   :ingredient_meals
  has_many   :ingredients, :through => :ingredient_meals

  validate :name, presence: true, uniqueness: true

  def nutrition_total(type)
    ingredient_meals = IngredientMeal.where(meal_id: self.id)
    values = []
    ingredient_meals.each do |i|
      ingredient = Ingredient.find_by_id(i.ingredient_id)
      # Fix what happens when ingredient is not found.
      values<<(ingredient.send(type) * i.servings)
    end
    values.inject(:+).round
  end

  def calories
    begin
      nutrition_total("calories")
    rescue
      nil
    end
  end

  def protein
    begin
    nutrition_total("protein")
    rescue
      nil
    end
  end

  def carbs
    begin
      nutrition_total("carbs")
    rescue
      nil
    end
  end

end
