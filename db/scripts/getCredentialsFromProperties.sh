source scripts/getPropertyFromFile.sh

properties=../src/cyclos.properties

dbUser=`getPropertyFromFile hibernate.connection.username $properties`
dbPwd=`getPropertyFromFile hibernate.connection.password $properties`