class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :name
      t.date :day
      t.text :country

      t.timestamps null: false
    end
  end
end
