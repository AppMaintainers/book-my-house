# frozen_string_literal: true

class House < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :ordered, -> { order(:name, :city) }
end
