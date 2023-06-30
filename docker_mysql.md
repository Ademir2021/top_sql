# Docker com mysql
`docker ps`
`docker ps -a`
`docker run`
`docker inspect meu-mysql`
`sudo docker images`
`sudo docker images --all`

# remover um container
`docker rm  e infomre o ID ou nome `

# Remover images
`docker image rmi docker 2a530178815d`

# localizar o host IP
`sudo docker inspect meu-mysql | grep IPAddress`
`sudo docker run mysql:5.7`
`sudo docker stop meu-mysql`
`sudo docker start meu-mysql`

# Variaveis de ambiente
`sudo docker run -e MYSQL_ROOT_PASSWORD=123 --name meu-mysql -d mysql:5.7`

# Para acessar com o localhost da maquina
`sudo docker run -e MYSQL_ROOT_PASSWORD=123 --name meu-mysql -d -p 3306:3306 mysql:5.7`
