class HolidaysController < ApplicationController
  
  def new
    @list_of_holidays = get_all_holidays
    @holiday = Holiday.new
  end
  
  def create
    @holiday = Holiday.new(holiday_params)
    @holiday.save
    redirect_to holiday_path(id: @holiday.id)
  end
  
  def index
    @list_of_holidays = get_all_holidays
  end
  
  def show
    @holiday = Holiday.find(params[:id])
  end
  
  private
  
    def holiday_params
      params.require(:holiday).permit(:name)
    end
    
    def get_all_holidays
      holiday_list = []
      rough_list = []
      country_list = Country::COUNTRIES
      country_list.each do |country|
        response = HTTParty.get("https://holidayapi.com/v1/holidays?country=#{country}&year=#{Date.today.year}")
        rough_list << response.parsed_response["holidays"]
      end
      rough_list.each do |date_hash|
        date_hash.each do |date, holiday_arr|
          holiday_arr.each do |holiday_hash|
            holiday_hash.each do |key, value|
              if key == "name"
                already_contained = false
                holiday_list.each do |n|
                  already_contained = true if value.include?(n)
                end
                holiday_list << value unless already_contained
              end
            end
          end
        end
      end
      return holiday_list
    end
  
end