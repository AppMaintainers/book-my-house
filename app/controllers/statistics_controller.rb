# frozen_string_literal: true

class StatisticsController < ApplicationController
  def show
    @most_popular_house = House.first
    @most_successful_year = 2014
  end
end
