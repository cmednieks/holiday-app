class CreateCalendarDates < ActiveRecord::Migration
  def change
    create_table :calendar_dates do |t|
      t.date :day

      t.timestamps null: false
    end
  end
end
