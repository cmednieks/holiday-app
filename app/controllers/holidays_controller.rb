class HolidaysController < ApplicationController
  
  
  def show
    
  end
  
  private
  
    def holiday_params
      params.require(:holiday).permit(:name, :country)
    end
    
  
end