require "test_helper"

class Task6ReactQueryTest < ActionDispatch::IntegrationTest
  test "task6: react query page renders component mount point" do
    get new_query_path(react: true)
    assert_response :success
    assert_select "[data-react-component=BookingForm]"
  end

  test "task6: api query endpoint returns booked status" do
    booking = bookings(:one)
    post api_query_path, params: {
      booking: { year: booking.day.year, month: booking.day.month, day: booking.day.day }
    }, as: :json
    assert_response :success
    json = JSON.parse(response.body)
    assert json["booked"], "Expected booked: true for a date with a booking"
  end

  test "task6: api query endpoint returns available status" do
    post api_query_path, params: {
      booking: { year: 2030, month: 1, day: 1 }
    }, as: :json
    assert_response :success
    json = JSON.parse(response.body)
    assert_not json["booked"], "Expected booked: false for an available date"
  end

  test "task6: BookingForm component is no longer a stub" do
    content = File.read(Rails.root.join("app/javascript/components/BookingForm.jsx"))
    assert_not content.include?("Under construction"),
      "BookingForm.jsx should be implemented, not a stub"
  end
end
