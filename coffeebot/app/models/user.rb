class User < ActiveRecord::Base
  has_many :analytics_usages
  validates :firstname, :length => { :maximum => 30 }, presence: true
  validates :lastname, :length => { :maximum => 30 }, presence: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates_format_of :phone_number,
    :with => /[0-9]{3}-[0-9]{3}-[0-9]{4}/,
    :message => "- Phone numbers must be in xxx-xxx-xxxx format."
end
