class BookingsController < ApplicationController
  def index
    @bookings = Booking.includes(:house).order(day: :desc)
  end

  def new
    @booking = Booking.new
    @houses = House.order(:name)
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully."
    else
      @houses = House.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:house_id, :day)
  end
end
