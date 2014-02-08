class Meal < ActiveRecord::Base
  attr_accessible :clean_up, :description, :homemade, :name, :prep_time
end
