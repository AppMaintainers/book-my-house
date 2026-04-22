class QueriesController < ApplicationController
  def new
    @react = params.key?(:react)
  end

  def create
    date = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    @bookings = Booking.includes(:house).where(day: date)
    @date = date
  rescue Date::Error
    redirect_to new_query_path, alert: "Invalid date."
  end
end
