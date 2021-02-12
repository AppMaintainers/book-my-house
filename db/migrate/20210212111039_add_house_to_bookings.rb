class AddHouseToBookings < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :bookings, :house, foreign_key: true
  end
end
