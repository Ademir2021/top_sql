#\bin\sh
# echo 'restaurando o backup centroinfo'
sudo -u postgres dropdb centroinfo
sudo -u postgres createdb -O postgres centroinfo
sudo -u postgres pg_restore -d centroinfo < centroinfo.bkp
# echo "restaurado com sucess !"