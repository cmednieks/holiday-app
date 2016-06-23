class CalendarDate < ActiveRecord::Base
  has_many :occurrences
end
