CREATE USER 'susply'@'localhost' IDENTIFIED BY 'sus';
CREATE DATABASE supplychainDB;
GRANT ALL PRIVILEGES ON supplychainDB.* TO 'susply'@'localhost';