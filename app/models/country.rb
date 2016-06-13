class Country < ActiveRecord::Base
  has_many :holidays
  has_many :days, through: :holidays
end
