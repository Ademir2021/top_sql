# Docker com mysql

`docker ps`
`docker run`
`docker inspect meu-mysql`
`sudo docker images`
`sudo docker images --all`
# localizar o host IP
`sudo docker inspect meu-mysql | grep IPAddress`
`sudo docker run mysql:5.7`
`sudo docker stop meu-mysql`
`sudo docker start meu-mysql`

# Variaveis de ambiente
`sudo docker run -e MYSQL_ROOT_PASSWORD=123 --name meu-mysql -d mysql:5.7`

# Para acessar com o localhost da maquina
`sudo docker run -e MYSQL_ROOT_PASSWORD=123 --name meu-mysql -d -p 3306:3306 mysql:5.7`
