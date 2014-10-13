json.array!(@airlines) do |airline|
  json.extract! airline, :id
  json.url airline_url(airline, format: :json)
end
