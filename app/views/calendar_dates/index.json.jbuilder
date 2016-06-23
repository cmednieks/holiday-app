json.array!(@calendar_dates) do |calendar_date|
  json.extract! calendar_date, :id, :day
  json.url calendar_date_url(calendar_date, format: :json)
end
