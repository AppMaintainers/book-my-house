# frozen_string_literal: true

class BookingsController < ApplicationController
  def index
    @bookings = Booking.all.ordered
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.expect(booking: %i[day house_id])
  end
end
