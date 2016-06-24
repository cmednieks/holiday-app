class CalendarDate < ActiveRecord::Base
  has_many :occurrences
  validates :day, presence: true, uniqueness: true
end
