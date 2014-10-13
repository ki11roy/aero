mkdir /tmp/iana
cp cleanup.sql /tmp/iana
mysql -u root -p < /tmp/iana/cleanup.sql 
rm -rf /tmp/iana
