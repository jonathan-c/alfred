class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :age, :gender, :weight, :feet, :inches, :name
  # attr_accessible :title, :body
  
  has_many :meals
  has_many :statuses
  
  validates :age, presence: true,  numericality: { greater_than: 12, less_than_or_equal_to: 80}
  validates :gender, presence: true
  validates :weight, presence: true, numericality: { greater_than: 30, less_than_or_equal_to: 650}
  validates :feet, presence: true, numericality: { greater_than_or_equal_to: 4, less_than_or_equal_to: 7}
  validates :inches, presence: true, numericality: { less_than: 12 }
  
  after_create :create_status
  
  def daily_requirement
    "#{req_daily_calories} calories, #{req_daily_protein}g protein, and #{req_daily_carbs}g of carbs"
  end
  
  def req_daily_calories
    height = ((self.feet*12) + self.inches) * 2.54
    divided_weight = (self.weight/2.2)
    if self.gender == "male"
      result = 66.5 + (13.75 * divided_weight) + (5.003 * height) - (6.775 * self.age)
    else 
      result = 655.1 + (9.563 * divided_weight) + (1.850 * height) - (4.676 * self.age)
		end
		result*=1.375 # Accounts for physical expenditure
		result+=(result * 0.40) # Extra calories to gain weight
		cals_per_day = result.round
  end
  
  def req_daily_protein
    protein_grams = (weight * 1.1).round
  end
  
  def req_daily_carbs
    cal_total = req_daily_calories - ((req_daily_protein * 4) + (req_daily_calories*0.30))
    carb_grams = (cal_total / 4.0).round
  end
  
  def req_daily_fats
    cal_total = req_daily_protein * 4
    fats = ((req_daily_calories * 0.30) / 9.0).round
  end
  
  def create_status
    Status.create(
      user_id: self.id, 
      weight: self.weight, 
      remaining_calories: self.req_daily_calories,
      remaining_protein: self.req_daily_protein,
      remaining_carbs: self.req_daily_carbs
      )
  end
  
  def eat(meal)
    MealStatus.create(status_id: statuses.last.id, meal_id: meal.id)
  end
  
  def remove_meal(meal)
    MealStatus.where(status_id: statuses.last.id, meal_id: meal.id).last.destroy
  end
end
