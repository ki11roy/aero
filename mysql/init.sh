mkdir /tmp/iana

cp init.sql /tmp/iana
cp air.sql /tmp/iana

mysql -u root -p < /tmp/iana/init.sql 
mysql -u root -p air < /tmp/iana/air.sql 

rm -rf /tmp/iana
