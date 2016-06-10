class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :name
      t.date :day_of_occurrence

      t.timestamps null: false
    end
  end
end
