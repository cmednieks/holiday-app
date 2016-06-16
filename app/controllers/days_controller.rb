class DaysController < ApplicationController
  def new
    @day = Day.new
  end
  
  def create
    @day = Day.new(day_params)   
    @day.country = Country::COUNTRIES_HASH.key(@day.country) unless @day.country == ''
    @day.save
    redirect_to day_path(id: @day.id)
  end

  def show
    @day = Day.find(params[:id])
    @list = get_holidays_on_day(@day)
  end

  def index
  end
  
  private
    
    def day_params
      params.require(:day).permit(:country, :year, :month, :day_of_month)
    end
    
    def get_holidays_on_day(day)
      array = []
      holidayArray = []
      country_list = Country::COUNTRIES_HASH.keys
      count = 0
      if day.country == ''
        country_list.each do |country|
          response = HTTParty.get("https://holidayapi.com/v1/holidays?country=#{country}&year=#{day.year}&month=#{day.month}&day=#{day.day_of_month}")
          array << response.parsed_response["holidays"]
        end
        array.each do |innerArray|
          innerArray.each do |holidayHash|
            holidayArray << holidayHash
          end
        end
      else
        response = HTTParty.get("https://holidayapi.com/v1/holidays?country=#{day.country}&year=#{day.year}&month=#{day.month}&day=#{day.day_of_month}")
        array << response.parsed_response["holidays"]
        array.each do |innerArray|
          innerArray.each do |holidayHash|
            holidayArray << holidayHash
          end
        end
      end
      return holidayArray
    end
  
end
