class Day < ActiveRecord::Base
  #attr_accessor :month, :year, :day_of_month
  has_many :holidays
  has_many :countries, through: :holidays
  MONTHS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  
  YEARS = []
  count = 1900
  while count < 2101
    YEARS << count
    count+=1
  end
  
  DAYS = []
  count = 1
  while count < 32
    DAYS << count
    count += 1
  end
   
  
end
