class Ingredient < ActiveRecord::Base
  attr_accessible :name, :calories, :protein, :carbs, :servings, :unit

  has_many :ingredient_meals
  has_many :meals, :through => :ingredient_meals

  validates :name, presence: true, uniqueness: true
  validates :calories, presence: true, numericality: true
  validates :protein, presence: true, numericality: true
  validates :carbs, presence: true, numericality: true
    # serving_size metric is ounces
  validates :serving_size, presence: true, numericality: { greater_than: 0 }

end
