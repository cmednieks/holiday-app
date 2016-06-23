json.array!(@occurrences) do |occurrence|
  json.extract! occurrence, :id, :holiday_id, :calendar_date_id
  json.url occurrence_url(occurrence, format: :json)
end
