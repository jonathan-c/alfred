class Meal < ActiveRecord::Base
  attr_accessible :clean_up, :description, :homemade, :name, :prep_time, :user_id, :status_id
  
  belongs_to :user
  belongs_to :status
  has_many   :ingredient_meals
  has_many   :ingredients, :through => :ingredient_meals
end
