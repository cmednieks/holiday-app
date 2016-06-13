class Day < ActiveRecord::Base
  has_many :holidays
  has_many :countries, through: :holidays
end
