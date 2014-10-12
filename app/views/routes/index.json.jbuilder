json.array!(@routes) do |route|
  json.extract! route, :id, :airline, :airline_id, :source_airport, :source_airport_id, :destination_airport, :destination_airport_id, :codeshare, :stops, :equipment
  json.url route_url(route, format: :json)
end
