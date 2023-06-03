Docker mariadb

https://hub.docker.com/_/mariadb

docker network create mariadb 
docker run --detach --network mariadb --name mariadb --env MARIADB_USER=antonio --env MARIADB_PASSWORD=antonio --env MARIADB_DATABASE=antonio --env MARIADB_ROOT_PASSWORD=peque -p 3306:3306 mariadb:latest

url mariadb
https://stackoverflow.com/questions/23020857/connect-to-mariadb-from-java-application-in-netbeans-on-linux-mageia


crear tabla mariadb
https://styde.net/crear-y-eliminar-tablas-en-mysql-mariadb/



Cliente mariadb
https://blogthinkbig.com/clientes-mysql-gratis-windows

