class HolidaysController < ApplicationController
  
  def home
  end
  
  def create
    redirect_to holidays_index_path
  end
  
  def index
    @country = params[:country]
    @year = params[:date_of_occurrence]
    @month = params[:date_of_occurrence]
    @day = params[:date_of_occurrence]
    #@hash_of_holidays = Hash.new
    @array_of_holidays = []
    holiday_count = 0
    response = HTTParty.get("https://holidayapi.com/v1/holidays?country=BE&year=2016&pretty")
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
