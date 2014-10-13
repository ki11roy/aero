CREATE TABLE airline_new LIKE airline;
LOAD DATA INFILE '/tmp/iana/database/airlines.dat' INTO TABLE airline_new FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\';
RENAME TABLE airline TO airline_tmp, airline_new TO airline;
DROP TABLE airline_tmp;

CREATE TABLE airport_new LIKE airport;
LOAD DATA INFILE '/tmp/iana/database/airports.dat' INTO TABLE airport_new FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\';
RENAME TABLE airport TO airport_tmp, airport_new TO airport;
DROP TABLE airport_tmp;

CREATE TABLE route_new LIKE route;
LOAD DATA INFILE '/tmp/iana/database/routes.dat' INTO TABLE route_new FIELDS TERMINATED BY ',' ESCAPED BY '\\'
(airline, airline_id, source_airport, source_airport_id, destination_airport, destination_airport_id, codeshare, stops, equipment);
RENAME TABLE route TO route_tmp, route_new TO route;
DROP TABLE route_tmp;

