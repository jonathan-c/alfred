class Status < ActiveRecord::Base
  attr_accessible :remaining_calories, :remaining_carbs, :remaining_protein, :weight, :user_id
  
  belongs_to :user
  has_many :meals
  
  after_save :update_users_weight , :if => Proc.new {|a| a.weight_changed?}
  
  def update_users_weight
    self.user.weight.update_attributes(weight: self.weight)
  end
  
end
