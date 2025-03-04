# frozen_string_literal: true

class CreateHouses < ActiveRecord::Migration[8.0]
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.string :city

      t.timestamps
      t.index :name, unique: true
    end
  end
end
