class Occurrence < ActiveRecord::Base
  belongs_to :holiday
  belongs_to :calendar_date
end
