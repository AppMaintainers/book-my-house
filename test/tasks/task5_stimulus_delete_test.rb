require "test_helper"

class Task5StimulusDeleteTest < ActionDispatch::IntegrationTest
  test "task5: bookings index has cancel button" do
    get bookings_path
    assert_select "a, button", /cancel|delete|remove/i
  end

  test "task5: delete route exists for bookings" do
    booking = bookings(:one)
    assert_routing(
      { method: :delete, path: "/bookings/#{booking.id}" },
      { controller: "bookings", action: "destroy", id: booking.id.to_s }
    )
  end

  test "task5: deleting a booking removes it" do
    booking = bookings(:one)
    assert_difference("Booking.count", -1) do
      delete "/bookings/#{booking.id}"
    end
  end

  test "task5: delete redirects with flash notice" do
    booking = bookings(:one)
    delete "/bookings/#{booking.id}"
    assert_redirected_to bookings_path
    follow_redirect!
    assert_match(/delet|cancel|remov/i, response.body)
  end

  test "task5: confirm stimulus controller is connected" do
    get bookings_path
    assert_select "[data-controller*=confirm]"
  end
end
