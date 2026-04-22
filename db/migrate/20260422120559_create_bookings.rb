class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :house, null: false, foreign_key: true
      t.date :day, null: false

      t.timestamps
    end

    add_index :bookings, [ :house_id, :day ], unique: true
  end
end
