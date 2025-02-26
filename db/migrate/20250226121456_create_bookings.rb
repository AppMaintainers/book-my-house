# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :house, null: false, foreign_key: true
      t.date :day, null: false

      t.timestamps

      t.index %i[house_id day], unique: true
    end
  end
end
