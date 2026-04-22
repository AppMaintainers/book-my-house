class CreateHouses < ActiveRecord::Migration[8.1]
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.string :city

      t.timestamps
    end

    add_index :houses, :name, unique: true
  end
end
