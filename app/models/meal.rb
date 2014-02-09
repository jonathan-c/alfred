class Meal < ActiveRecord::Base
  attr_accessible :name, :description, :clean_up, :homemade, :prep_time, :user_id, :status_id
  
  belongs_to :user
  belongs_to :status
  has_many   :ingredient_meals
  has_many   :ingredients, :through => :ingredient_meals
  
  validate :name, presence: true, uniqueness: true
end
