class StatisticsController < ApplicationController
  def show
    # TODO: These are hardcoded and wrong! Fix them with real database queries.
    @most_popular_house = House.first
    @most_successful_year = 2024
    @average_bookings_per_house = 5.0
  end
end
