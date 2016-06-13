class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :year
      t.string :month
      t.string :day_of_month

      t.timestamps null: false
    end
  end
end
