require "test_helper"

class Task4PaginationTest < ActionDispatch::IntegrationTest
  setup do
    house = houses(:one)
    # Create 25 bookings total (1 from fixtures + 24 new)
    (1..24).each do |i|
      Booking.create!(house: house, day: Date.new(2027, 1, 1) + i.days)
    end
  end

  test "task4: bookings index shows only 10 bookings per page" do
    get bookings_path
    assert_select "tr td", minimum: 1 # has table rows
    # Count booking rows (each booking has house, city, day cells)
    booking_rows = css_select("tbody tr")
    assert_equal 10, booking_rows.size, "Expected 10 bookings per page, got #{booking_rows.size}"
  end

  test "task4: page 2 shows next set of bookings" do
    get bookings_path(page: 2)
    assert_response :success
    booking_rows = css_select("tbody tr")
    assert_equal 10, booking_rows.size
  end

  test "task4: first page has no previous link" do
    get bookings_path
    assert_select "a", { text: /previous/i, count: 0 }
  end

  test "task4: last page has no next link" do
    get bookings_path(page: 3)
    assert_select "a", { text: /next/i, count: 0 }
  end

  test "task4: page indicator shows current page" do
    get bookings_path(page: 2)
    assert_match(/page 2/i, response.body)
  end
end
