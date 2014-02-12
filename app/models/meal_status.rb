class MealStatus < ActiveRecord::Base
  attr_accessible :meal_id, :status_id
  after_create :subtract_remaining_nutrients
  after_destroy :re_add_remaining_nutrients 
  
  belongs_to :meal
  belongs_to :status
  
  def subtract_remaining_nutrients    
    calories = []
    protein = []
    carbs = []
    self.status.meals.each do |meal|
      calories<<meal.calories
      protein<<meal.protein
      carbs<<meal.carbs
    end
    status.remaining_calories=(self.status.user.req_daily_calories)-(calories.inject(:+))
    status.remaining_protein=(self.status.user.req_daily_protein)-(protein.inject(:+))
    status.remaining_carbs=(self.status.user.req_daily_carbs)-(carbs.inject(:+))
    status.save
  end
  
  def re_add_remaining_nutrients
    calories = meal.calories
    protein = meal.protein
    carbs = meal.carbs
    status.remaining_calories+=calories
    status.remaining_protein+=protein
    status.remaining_carbs+=carbs
    status.save
  end
end
