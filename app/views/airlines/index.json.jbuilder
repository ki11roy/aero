json.array!(@airlines) do |airline|
  json.extract! airline, :id, :id, :name, :alias, :iata, :icao, :callsign, :country, :active
  json.url airline_url(airline, format: :json)
end
