class Ingredient < ActiveRecord::Base
  attr_accessible :name, :calories, :protein, :carbs, :price, :serving_size, :servings
  
  has_many :ingredient_meals
  has_many :meals, :through => :ingredient_meals
  
  validates :name, presence: true, uniqueness: true
  validates :calories, presence: true, numericality: true
  validates :protein, presence: true, numericality: true
  validates :carbs, presence: true, numericality: true
  validates :price, numericality: true, :format => { :with => /^\d{1,4}(\.\d{0,2})?$/ }, allow_nil: true
  # serving_size metric is ounces
  validates :serving_size, presence: true, numericality: true
  validates :servings, presence: true, numericality: true
  
  
  # MealIngredient.create(meal_id: 1, ingredient_id: 2, servings: 2)
  # servings = MealIngredients.where("meal_id = ? and ingredient_id = ?", self.id, ingredient.id).servings
  # ingredient.calculate_nutrition_facts_for_meal(servings)
  
  def calculate_meal_calories(servings)
    self.calories * servings
  end
  
  def calculate_meal_protein(servings)
    self.protein * servings
  end
  
  def calculate_meal_carbs(servings)
    self.carbs * servings
  end

end
