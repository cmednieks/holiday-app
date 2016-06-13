class DaysController < ApplicationController
  def new
    @day = Day.new
  end
  
  def create
    @day = Day.new(day_params)
    @day.save
    redirect_to day_path(id: @day.id)
  end

  def show
    @day = Day.find(params[:id])
    @holidays = get_holidays_on_day(@day)
    @response = HTTParty.get("https://holidayapi.com/v1/holidays?country=US&year=#{@day.year}&month=#{@day.month}&day=#{@day.day_of_month}")
  end

  def index
  end
  
  private
    
    def day_params
      params.require(:day).permit(:year, :month, :day_of_month)
    end
    
    def get_holidays_on_day(day)
      holidays = []
      country_list = Country::COUNTRIES
      count = 0
    #  for country_list.each do |country|
    #    response = HTTParty.get("https://holidayapi.com/v1/holidays?country=#{country}&year=#{day.year}&month=#{day.month}&day=#{day.day_of_month}")
    #  end
    end
  
end
