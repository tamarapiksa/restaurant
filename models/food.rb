class Food < ActiveRecord::Base
  has_many :orders 
  has_many :partys, through: :orders 

  validates :name, presence: true, uniqueness: true 
end 