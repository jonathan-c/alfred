class Status < ActiveRecord::Base
  attr_accessible :remaining_calories, :remaining_carbs, :remaining_protein, :weight, :user_id
  
  belongs_to :user
  has_many :meal_statuses
  has_many :meals, :through => :meal_statuses 
  
  after_save :update_users_weight , :if => Proc.new {|a| a.weight_changed?}
  after_save :check_calories_for_negative_value, :if => Proc.new { |a| a.remaining_calories_changed? }
  after_save :check_protein_for_negative_value, :if => Proc.new { |a| a.remaining_protein_changed? }
  after_save :check_carbs_for_negative_value, :if => Proc.new { |a| a.remaining_carbs_changed? }
  
  def update_users_weight
    user.update_attributes(weight: self.weight)
  end
  
  def check_calories_for_negative_value
    if remaining_calories < 0
      self.update_attributes(remaining_calories: 0)
    end
  end
  
  def check_protein_for_negative_value
    if remaining_protein < 0
      self.update_attributes(remaining_protein: 0)
    end
  end
  
  def check_carbs_for_negative_value
    if remaining_carbs < 0
      self.update_attributes(remaining_carbs: 0)
    end
  end
end
