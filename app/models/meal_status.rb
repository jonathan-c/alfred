class MealStatus < ActiveRecord::Base
  attr_accessible :meal_id, :status_id
  after_create :update_remaining_nutrients
  
  belongs_to :meal
  belongs_to :status
  
  def update_remaining_nutrients
    calories = meal.calories
    protein = meal.protein
    carbs = meal.carbs
    status.remaining_calories-=calories
    status.remaining_protein-=protein
    status.remaining_carbs-=carbs
    status.save
  end
end
