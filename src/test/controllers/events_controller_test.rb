require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url,
        params: { 
          event: { 
            name: "TshpcConf 2019",
            description: "The 3rd workshop in High Performance Computing and 
                          and Artificial Intelligence",
            price: 99.99, 
            discounted_price: 49.99, 
            location: "EPT Tunisia",
            starts_at: "2019-03-27 08:00:00",
            ends_at: "2019-03-29 17:00:00"
          } 
        }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event),
      params: { 
        event: { 
          name: @event.name,
          description: @event.description,
          starts_at: @event.starts_at,
          ends_at: @event.ends_at,
          location: @event.location,
          price: @event.price,
          discounted_price: @event.discounted_price
        }
      }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
