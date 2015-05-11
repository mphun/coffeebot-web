class Brew < ActiveRecord::Base

  attr_accessible :brew_type, :level
  has_many :coffee_analytics
  has_many :analytics_usages
  validates :brew_type, presence: true, uniqueness: true
  validates :filled_at, presence: true 
  validates :state, presence: true
end
