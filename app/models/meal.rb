class Meal < ActiveRecord::Base
  attr_accessible :clean_up, :description, :homemade, :name, :prep_time, :user_id
  
  belongs_to :user
end
