require 'test_helper'

class EventTest < ActiveSupport::TestCase
	fixtures :events

  test "event attributes must not be empty" do
  	event = Event.new
  	assert event.invalid?
  	assert event.errors[:name].any?
  	assert event.errors[:description].any?
  	assert event.errors[:price].any?
  	assert event.errors[:discounted_price].any?
  end

  test "event prices must be positive" do
  	event = Event.new(name: "hpcConf",
  		                description: "hpc conf 2019",
  		                location: "somewhere",
  		                price: 9.99,
  		                discounted_price: 9.99)
  	event.price = -1
  	assert event.invalid?
  	assert event.errors[:price].any?
		event.price = 1
  	assert event.valid? 

  	event.discounted_price = -1
  	assert event.invalid?
  	assert event.errors[:discounted_price].any?
		event.discounted_price = 1
  	assert event.valid? 
  end

  test "event is not valid with a unique name" do
		event = Event.new(name: events(:one).name,
  		                description: "hpc conf 2019",
  		                location: "somewhere",
  		                price: 9.99,
  		                discounted_price: 9.99)
  	assert event.invalid?
  	assert_equal [I18n.translate('errors.messages.taken')],
  							 event.errors[:name]
  	# assert event.errors[:name].join(" ").include?("taken")
	end
end
