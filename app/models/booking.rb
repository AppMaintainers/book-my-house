# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :house

  validates :day, presence: true, uniqueness: true

  scope :ordered, -> { order(:day) }

  def self.booked_for?(date)
    where(day: date).present?
  end
end
