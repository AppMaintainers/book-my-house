# frozen_string_literal: true

module Api
  class QueriesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      render json: { booked: Booking.booked_for?(query_date) }
    end

    private

    def query_date
      booking_params = params.expect(booking: %i[year month day])
      Date.new(booking_params[:year], booking_params[:month], booking_params[:day])
    end
  end
end
