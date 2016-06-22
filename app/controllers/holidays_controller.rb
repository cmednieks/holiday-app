class HolidaysController < ApplicationController
  
  def find
    @holiday_list = Holiday.get_all_holidays
  end
  
  def show
    
  end
  
  private
  
    def holiday_params
      params.require(:holiday).permit(:name)
    end
    
  
end