require "test_helper"

class Task1GuestCountTest < ActionDispatch::IntegrationTest
  test "task1: bookings table has number_of_guests column" do
    assert Booking.column_names.include?("number_of_guests"),
      "Expected bookings table to have a 'number_of_guests' column"
  end

  test "task1: validates number_of_guests presence" do
    booking = Booking.new(house: houses(:one), day: Date.new(2026, 12, 1))
    assert_not booking.valid?, "Booking without number_of_guests should be invalid"
    assert booking.errors[:number_of_guests].any?, "Expected error on number_of_guests"
  end

  test "task1: validates number_of_guests minimum is 1" do
    booking = Booking.new(house: houses(:one), day: Date.new(2026, 12, 2), number_of_guests: 0)
    assert_not booking.valid?, "Booking with 0 guests should be invalid"
  end

  test "task1: validates number_of_guests maximum is 12" do
    booking = Booking.new(house: houses(:one), day: Date.new(2026, 12, 3), number_of_guests: 13)
    assert_not booking.valid?, "Booking with 13 guests should be invalid"
  end

  test "task1: booking form has number_of_guests field" do
    get new_booking_path
    assert_response :success
    assert_select "input[name*=number_of_guests]"
  end

  test "task1: bookings index displays guest count" do
    booking = Booking.create!(house: houses(:one), day: Date.new(2026, 12, 4), number_of_guests: 4)
    get bookings_path
    assert_response :success
    assert_match "4", response.body
  end
end
