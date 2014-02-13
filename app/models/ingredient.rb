class Ingredient < ActiveRecord::Base
  attr_accessible :name, :calories, :protein, :carbs, :price, :serving_size, :servings, :unit
  
  has_many :ingredient_meals
  has_many :meals, :through => :ingredient_meals
  
  validates :name, presence: true, uniqueness: true
  validates :calories, presence: true, numericality: true
  validates :protein, presence: true, numericality: true
  validates :carbs, presence: true, numericality: true
  validates :price, numericality: true, :format => { :with => /^\d{1,4}(\.\d{0,2})?$/ }, allow_nil: true
  # serving_size metric is ounces
  validates :serving_size, presence: true, numericality: { greater_than: 0 }
  validates :servings, presence: true, numericality: true

end
