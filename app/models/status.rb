class Status < ActiveRecord::Base
  attr_accessible :remaining_calories, :remaining_carbs, :remaining_protein, :weight, :user_id
  
  belongs_to :user
  has_many :meals, after_add: :update_remaining_nutrients
  
  after_save :update_users_weight , :if => Proc.new {|a| a.weight_changed?}
  
  def update_users_weight
    user.update_attributes(weight: self.weight)
  end
  
  # refactor
  def update_remaining_nutrients(meal)
    calories = [] 
    protein = []
    carbs = []
    meals.each do |meal|
      calories<<meal.calories
      protein<<meal.protein
      carbs<<meal.carbs
    end
    self.update_attributes(remaining_calories: user.req_daily_calories-calories.inject(:+))
    self.update_attributes(remaining_protein: user.req_daily_protein-protein.inject(:+))
    self.update_attributes(remaining_carbs: user.req_daily_carbs-carbs.inject(:+))
  end
  
end
