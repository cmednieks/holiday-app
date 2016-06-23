class RemoveDayFromHoliday < ActiveRecord::Migration
  def change
    remove_column :holidays, :day, :date
  end
end
