class AddUniqueIndexToCalendarDates < ActiveRecord::Migration
  def change
    add_index(:calendar_dates, :day, unique: true)
  end
end
