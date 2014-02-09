class Status < ActiveRecord::Base
  attr_accessible :remaining_calories, :remaining_carbs, :remaining_protein, :weight, :user_id
  
  belongs_to :user
  has_many :meals
end
