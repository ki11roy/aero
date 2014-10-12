json.array!(@airports) do |airport|
  json.extract! airport, :id, :id, :name, :city, :country, :iata_faa, :icao, :latitude, :longitude, :altitude, :timezone, :dst, :tz_databse
  json.url airport_url(airport, format: :json)
end
