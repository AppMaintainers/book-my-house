require "test_helper"

class Task7CalendarApiTest < ActionDispatch::IntegrationTest
  test "task7: house bookings API endpoint exists" do
    house = houses(:one)
    get "/api/houses/#{house.id}/bookings", params: { month: "2025-03" }
    assert_response :success
  end

  test "task7: house bookings API returns correct dates" do
    house = houses(:one)
    get "/api/houses/#{house.id}/bookings", params: { month: "2025-03" }
    json = JSON.parse(response.body)
    assert_includes json["bookings"], "2025-03-10"
  end

  test "task7: house bookings API filters by month" do
    house = houses(:popular)
    get "/api/houses/#{house.id}/bookings", params: { month: "2025-01" }
    json = JSON.parse(response.body)
    assert_includes json["bookings"], "2025-01-10"
    assert_not_includes json["bookings"], "2025-03-15"
  end

  test "task7: house show page has calendar mount point" do
    house = houses(:one)
    get "/houses/#{house.id}"
    assert_select "[data-react-component=AvailabilityCalendar]"
  end
end
