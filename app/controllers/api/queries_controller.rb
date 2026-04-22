module Api
  class QueriesController < ApplicationController
    skip_forgery_protection

    def create
      date = Date.new(
        params[:booking][:year].to_i,
        params[:booking][:month].to_i,
        params[:booking][:day].to_i
      )
      bookings = Booking.includes(:house).where(day: date)

      render json: {
        booked: bookings.any?,
        date: date.to_s,
        houses: bookings.map { |b| b.house.name }
      }
    rescue Date::Error
      render json: { error: "Invalid date." }, status: :unprocessable_entity
    end
  end
end
