class HolidaysController < ApplicationController
  
  def home
    @holidays = Hash.new
  end
  
  def create_date
    redirect_to holidays_index_path
  end
  
  def index
    @country = params[:country]
    @date = params[:day_of_occurrence]
    #@hash_of_holidays = Hash.new
    @array_of_holidays = []
    holiday_count = 0
    response = HTTParty.get('https://holidayapi.com/v1/holidays?country=US&year=2016')
    parsed_resp_holidays = response.parsed_response["holidays"]
    parsed_resp_holidays.each do |date, info|
      info.each do |dateArray|
        dateArray.each do |holidayHash|
          holiday_count+=1
          holidayHash.each do |key, value|
            desired_holiday_string = key.to_s + value.to_s
            @array_of_holidays << desired_holiday_string
            #@hash_of_holidays[:holiday_count] << desired_holiday_string
          end
        end
      end
    end
  end
  
end