class HolidaysController < ApplicationController
  
  def home
  end
  
  def create
    @country = params[:country]
    @day = params[:date_of_occurrence]
    redirect_to holidays_index_path
  end
  
  def index
    @response = HTTParty.get(https://holidayapi.com/v1/holidays?country=US&year=2016&pretty)
  end

end
