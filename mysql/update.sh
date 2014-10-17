#!/bin/sh

mkdir /tmp/iana
mkdir /tmp/iana/database
cd /tmp/iana/database
wget 'https://sourceforge.net/p/openflights/code/HEAD/tree/openflights/data/airports.dat?format=raw' -O 'airports.dat'
wget 'https://sourceforge.net/p/openflights/code/HEAD/tree/openflights/data/airlines.dat?format=raw' -O 'airlines.dat'
wget 'https://sourceforge.net/p/openflights/code/HEAD/tree/openflights/data/routes.dat?format=raw' -O 'routes.dat'
cd - 

sed -ri '/^-1/d' /tmp/iana/database/airlines.dat

cp update.sql /tmp/iana
mysql -u air --password=VeryThinAir air < /tmp/iana/update.sql 
sed -ri '1ipid,name,city,country,iata,icao,latitude,longitude,altitude,timezone,dst,timezone_text' /tmp/iana/database/airports.dat

#sed -ri '1ilid,name,alias,iata,icao,callsign,country,active' /tmp/iana/database/airlines.dat

./csv2json.pl -c /tmp/iana/database/airports.dat > /tmp/iana/database/airports.json
./prepare_soul.pl /tmp/iana/database/airports.json /tmp/iana/database 

redis-cli flushdb
soulmate load icao --redis=redis://localhost:6379/0 < /tmp/iana/database/airports.icao.soul
soulmate load iata --redis=redis://localhost:6379/0 < /tmp/iana/database/airports.iata.soul
soulmate load name --redis=redis://localhost:6379/0 < /tmp/iana/database/airports.name.soul
soulmate load country --redis=redis://localhost:6379/0 < /tmp/iana/database/airports.country.soul

#rm -rf /tmp/iana
