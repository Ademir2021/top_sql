##bin\sh
echo 'iniciando o backup da base centroinfo'
pg_dump -U ademir -d centroinfo -F c -b -v -f centroinfo.bkp
echo 'backup realizado com sucess !'