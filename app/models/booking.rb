class Booking < ApplicationRecord
  belongs_to :house

  validates :day, presence: true, uniqueness: { scope: :house_id }
end
