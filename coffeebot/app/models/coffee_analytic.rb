class CoffeeAnalytic < ActiveRecord::Base
  belongs_to :brew
  validates :brew_type, presence: true
  validates :update_time, presence: true
end
