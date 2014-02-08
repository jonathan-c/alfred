class Status < ActiveRecord::Base
  attr_accessible :remaining_calories, :remaining_carbs, :remaining_protein, :weight
end
