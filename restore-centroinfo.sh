#\bin\sh
echo 'restaurando o backup centroinfo'
sudo -u ademir dropdb test
sudo -u ademir createdb -O ademir centroinfo
pg_restore -U ademir -d centroinfo -v -c centroinfo.bkp
echo "restaurado com sucess !"