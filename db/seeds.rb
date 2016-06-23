# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

curr_date = Date.today
while curr_date.year < Date.today.year + 51
  CalendarDate.create(day: curr_date)
  curr_date += 1
end


__END__

COUNTRIES_HASH = { 'BE' => 'Belgium', 'BG' => 'Bulgaria', 'BR' => 'Brazil', 'CA' => 'Canada',
                 'CZ' => 'Czech Republic', 'DE' => 'Germany', 'ES' => 'Spain', 'FR' => 'France',
                 'GB' => 'Great Britain', 'GT' => 'Guatemala', 'HR' => 'Croatia', 'IT' => 'Italy',
                 'NL' => 'Netherlands', 'NO' => 'Norway', 'PL' => 'Poland', 'SI' => 'Slovenia', 
                 'SK' => 'Slovakia', 'US' => 'United States' }

rough_array = []                 
COUNTRIES_HASH.each do |key, value|
  year_count = Date.today.year 
  while year_count < Date.today.year + 51
    resp = HTTParty.get("https://holidayapi.com/v1/holidays?country=#{key}&year=#{year_count}")
    rough_array << resp.parsed_response["holidays"]
    year_count+=1
  end
end
array_of_holiday_instances = []
rough_array.each do |dateHash|
  dateHash.each do |date_key, array_value|
    array_value.each do |holiday_hash|
      already_contained = false
      array_of_holiday_instances.each do |saved_holiday| if array_of_holiday_instances.length > 0
        if holiday_hash["name"] == saved_holiday[:name] 
          already_contained = true
          holi = saved_holiday
        end
        if already_contained
          holi.day << holiday_hash["date"]
          country_already_contained = false
          holi.countries.each do |country|
            if holiday_hash["country"] == country
              country_already_contained = true
            end
          end
          holi.countries << holiday_hash["country"] unless country_already_contained
          holi.save
        end
        alread_contained = false
      end
      if already_contained == false
        date_arr = holiday_hash["date"].split('-')
        new_holiday = Holiday.new
        new_holiday.name = holiday_hash["name"]
        new_holiday.day << Date.new(date_arr[0].to_i, date_arr[1].to_i, date_arr[2].to_i)
        new_holiday.countries << holiday_hash["country"]
        new_holiday.save
        array_of_holiday_instances << new_holiday
      end
    end
  end
end