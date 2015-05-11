class AnalyticsUsage < ActiveRecord::Base
  belongs_to :brew
  belongs_to :user
  validates :username, presence: true
  validates :coffee_brew_type, presence: true
  validates :age, presence: true
end
