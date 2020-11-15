#Creating database
DROP DATABASE IF EXISTS Music;
CREATE DATABASE Music;
USE Music;
#Creating tables

#Creating user
DROP USER IF EXISTS Wojciech13@localhost;
CREATE USER Wojciech13@localhost IDENTIFIED BY '316452';

GRANT SELECT, INSERT, DELETE ON Music.* TO Wojciech13@localhost;

#FLUSH PRIVILEGES;