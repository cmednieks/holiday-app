# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CalendarDate.delete_all
curr_date = Date.today
while curr_date.year < Date.today.year + 5
  CalendarDate.where(day: curr_date).first_or_create
  curr_date += 1
end

COUNTRIES_HASH = { 'BE' => 'Belgium', 'BG' => 'Bulgaria', 'BR' => 'Brazil', 'CA' => 'Canada',
                 'CZ' => 'Czech Republic', 'DE' => 'Germany', 'ES' => 'Spain', 'FR' => 'France',
                 'GB' => 'Great Britain', 'GT' => 'Guatemala', 'HR' => 'Croatia', 'IT' => 'Italy',
                 'NL' => 'Netherlands', 'NO' => 'Norway', 'PL' => 'Poland', 'SI' => 'Slovenia', 
                 'SK' => 'Slovakia', 'US' => 'United States' }

rough_array = []                 
COUNTRIES_HASH.each do |key, value|
  year_count = Date.today.year 
  while year_count < Date.today.year + 5
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
      array_of_holiday_instances.each do |saved_holiday|
        if holiday_hash["name"] == saved_holiday.name && holiday_hash["country"] == saved_holiday.country
          already_contained = true
        end
      end
      if already_contained
        existing_h = Holiday.find_by(name: holiday_hash["name"], country: holiday_hash["country"])
        d = Date.new(holiday_hash["date"].to_i)
        existing_h.occurrences.create(calendar_date: CalendarDate.find_by(day: d))
      else
        new_h = Holiday.create(name: holiday_hash["name"], country: holiday_hash["country"])
        d = Date.new(holiday_hash["date"].to_i)
        new_h.occurrences.create(calendar_date: CalendarDate.find_by(day: d))
        array_of_holiday_instances << new_h
      end
    end
  end
end