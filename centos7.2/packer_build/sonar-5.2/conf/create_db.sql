CREATE DATABASE sonar CHARACTER SET utf8;
 
GRANT ALL ON sonar.* TO 'sonar' IDENTIFIED BY 'password';
GRANT ALL ON sonar.* TO 'sonar'@'localhost' IDENTIFIED BY 'password';
 
FLUSH PRIVILEGES;
