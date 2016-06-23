class Holiday < ActiveRecord::Base
  has_many :occurrences
end
