rails generate scaffold Airport id:integer name:string city:string country:string iata_faa:string icao:string latitude:float longitude:float altitude:integer timezone:string dst:string tz_databse:string
rails generate scaffold Airline id:integer name:string alias:string iata:string icao:string callsign:string country:string active:boolean
rails generate scaffold Route airline:string airline_id:integer source_airport:string source_airport_id:integer destination_airport:string destination_airport_id:integer codeshare:boolean stops:integer equipment:string
