#!/bin/sh

mkdir database
cd database
wget 'https://sourceforge.net/p/openflights/code/HEAD/tree/openflights/data/airports.dat?format=raw' -O 'airports.dat'
wget 'https://sourceforge.net/p/openflights/code/HEAD/tree/openflights/data/airlines.dat?format=raw' -O 'airlines.dat'
wget 'https://sourceforge.net/p/openflights/code/HEAD/tree/openflights/data/routes.dat?format=raw' -O 'routes.dat'
cd ..

