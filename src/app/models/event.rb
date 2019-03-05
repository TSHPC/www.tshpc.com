class Event < ApplicationRecord
	# make sure the events  attribute are present:
	validates_presence_of :name,
												:description,
												:price,
												:discounted_price,
												:location
	# make sure :name is unique:
	validates_uniqueness_of :name
	# make sure the prices are numbers > 0:
	validates :price, :discounted_price, 
						 numericality: {greater_than_or_equal_to: 0.01}
  # association with schedules:
  has_one :schedule
  # association with registrations:
  has_many :registrations, dependent: :destroy 
  has_many :users, through: :registrations, dependent: :destroy 
end
