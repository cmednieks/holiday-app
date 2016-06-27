json.array!(@holidays) do |holiday|
  json.extract! holiday, :id, :new, :index, :edit, :show
  json.url holiday_url(holiday, format: :json)
end
