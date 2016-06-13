class Holiday < ActiveRecord::Base
  attr_accessor :country, :day
  belongs_to :country
  belongs_to :day
end
