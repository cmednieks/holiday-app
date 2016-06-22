class Holiday
  COUNTRIES_HASH = { 'BE' => 'Belgium', 'BG' => 'Bulgaria', 'BR' => 'Brazil', 'CA' => 'Canada',
                   'CZ' => 'Czech Republic', 'DE' => 'Germany', 'ES' => 'Spain', 'FR' => 'France',
                   'GB' => 'Great Britain', 'GT' => 'Guatemala', 'HR' => 'Croatia', 'IT' => 'Italy',
                   'NL' => 'Netherlands', 'NO' => 'Norway', 'PL' => 'Poland', 'SI' => 'Slovenia', 
                   'SK' => 'Slovakia', 'US' => 'United States' }
  COUNTRIES_ABBRV = COUNTRIES_HASH.keys
  
  
  attr_accessor :name, :dates, :country
  
  def initialize(name, dates, country)
    @name = name
    @dates = dates
    @country = country
  end
  
  
  def self.where(country, year, month, day)
    holidays_array = []
    if country == ''
      big_arr = []
      COUNTRIES_ABBRV.each do |country_x|
        api_response = HTTParty.get("https://holidayapi.com/v1/holidays?country=#{country_x}&year=#{year}&month=#{month}&day=#{day}")
        big_arr << json_parser(api_response)
      end
      big_arr.each do |inner_arr|
        inner_arr.each do |holiday_hash|
          holidays_array << holiday_hash
        end
      end
    else
      api_response = HTTParty.get("https://holidayapi.com/v1/holidays?country=#{country}&year=#{year}&month=#{month}&day=#{day}")
      holidays_array = json_parser(api_response)
    end
    return_value = []
    holidays_array.each do |holiday_hash|
      dates = []
      country = nil
      name = nil
      holiday_hash.each do |key, value|
        if key == "name"
          name = value
        elsif key == "date"
          dates << Date.new(year, month, day)
        elsif key == "country"
          country = value
        end
      end
      return_value << new(name, dates, country)
    end
    return_value
  end
  
  def self.find(name, year)
    country_list = COUNTRIES_ABBRV
    holidays_array = []
    new_holiday = Holiday.new(name, [], "")
    country_list.each do |country|
      api_response = HTTParty.get("https://holidayapi.com/v1/holidays?country=#{country}&year=#{year}")
      holidays_array << json_parser(api_response)
    end
    holidays_array.each do |inner_arr|
      inner_arr.each do |holiday_hash|
        if holiday_hash["name"] == name
          date_arr = holiday_hash["date"].split('-')
          new_holiday.dates << Date.new(date_arr[0].to_i, date_arr[1].to_i, date_arr[2].to_i) unless new_holiday.dates[0] == Date.new(date_arr[0].to_i, date_arr[1].to_i, date_arr[2].to_i)
          new_holiday.country = holiday_hash["country"] 
        end
      end
    end
    new_holiday
  end
  
  def self.get_all_holidays
    holidays_array = []
    final_array = []
    country_list = COUNTRIES_ABBRV
    country_list.each do |country|
      response = HTTParty.get("https://holidayapi.com/v1/holidays?country=#{country}&year=#{Date.today.year}")
      holidays_array << Holiday.json_parser(response)
    end
    holidays_array.each do |inner_arr|
      inner_arr.each do |holiday_hash|
        holiday_hash.each do |key, value|
          if key == "name"
            already_contained = false
            holidays_array.each do |n|
              already_contained = true if value == n
            end
            final_array << value unless already_contained
          end
        end
      end
    end
    return final_array
  end
  
  def multi_day_holiday? 
    return @dates.length > 1
  end
  
  private
  
    def self.json_parser(api_response)
      big_array = []
      array_of_holiday_hashes = []
      big_array << api_response.parsed_response["holidays"]
      if big_array[0].kind_of?(Array)
        big_array.each do |innerArray|
          innerArray.each do |holiday_hash|
            array_of_holiday_hashes << holiday_hash
          end
        end
      else
        big_array.each do |dateHash|
          dateHash.each do |date_key, array_value|
            array_value.each do |holiday_hash|
              array_of_holiday_hashes << holiday_hash
            end
          end
        end
      end
      return array_of_holiday_hashes
    end
  
end