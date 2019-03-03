class Event < ApplicationRecord
	validates_presence_of :name,
												:description,
												:price,
												:discounted_price,
												:location
	validates_uniqueness_of :name
  has_one :schedule
end
