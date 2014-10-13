CREATE DATABASE air;
USE air;

CREATE USER 'air'@'localhost' IDENTIFIED BY 'VeryThinAir';
GRANT ALL PRIVILEGES ON air.* TO 'air'@'localhost';
GRANT FILE ON *.* TO 'air'@'localhost';
FLUSH PRIVILEGES;

