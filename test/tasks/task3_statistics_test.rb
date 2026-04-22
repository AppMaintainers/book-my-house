require "test_helper"

class Task3StatisticsTest < ActionDispatch::IntegrationTest
  test "task3: most popular house is calculated correctly" do
    # "Popular House" has 5 bookings in fixtures, others have 1 each
    get statistics_path
    assert_response :success
    assert_match "Popular House", response.body
  end

  test "task3: most successful year is calculated correctly" do
    # 2025 has 6 bookings in fixtures, 2024 has 1
    get statistics_path
    assert_match "2025", response.body
  end

  test "task3: average bookings per house is displayed" do
    get statistics_path
    # 7 bookings / 3 houses = 2.3
    assert_match(/\d+\.\d/, response.body, "Expected a decimal number for average")
  end

  test "task3: statistics handles no bookings gracefully" do
    Booking.delete_all
    get statistics_path
    assert_response :success
    assert_match(/no data available/i, response.body)
  end
end
