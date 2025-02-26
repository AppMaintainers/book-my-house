# frozen_string_literal: true

class QueriesController < ApplicationController
  def new
    @react_enabled = params.key?('react')
  end

  def create
    @day = query_date
    @booked = Booking.booked_for?(@day)

    render :new
  end

  private

  def query_date
    booking_params = params.expect(booking: ['day(1i)', 'day(2i)', 'day(3i)'])

    year = booking_params['day(1i)'].to_i
    month = booking_params['day(2i)'].to_i
    day = booking_params['day(3i)'].to_i

    Date.new(year, month, day)
  end
end
