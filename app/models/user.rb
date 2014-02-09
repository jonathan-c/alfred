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
end
