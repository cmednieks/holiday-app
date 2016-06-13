class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :country
      t.integer :year
      t.integer :month
      t.integer :day_of_month

      t.timestamps null: false
    end
  end
end
