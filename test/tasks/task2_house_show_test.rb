require "test_helper"

class Task2HouseShowTest < ActionDispatch::IntegrationTest
  test "task2: house show page exists" do
    get "/houses/#{houses(:one).id}"
    assert_response :success
  end

  test "task2: house show page displays house name and city" do
    house = houses(:one)
    get "/houses/#{house.id}"
    assert_select "h1", house.name
    assert_match house.city, response.body
  end

  test "task2: house show page lists its bookings" do
    house = houses(:one)
    get "/houses/#{house.id}"
    assert_match bookings(:one).day.to_s, response.body
  end

  test "task2: booking partial links to house show page" do
    house = houses(:one)
    get bookings_path
    assert_select "a[href=?]", "/houses/#{house.id}"
  end

  test "task2: house show page handles house with no bookings" do
    house = House.create!(name: "Empty House", city: "Nowhere")
    get "/houses/#{house.id}"
    assert_response :success
    assert_match(/no bookings/i, response.body)
  end
end
