class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.references :holiday, index: true, foreign_key: true
      t.references :calendar_date, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
