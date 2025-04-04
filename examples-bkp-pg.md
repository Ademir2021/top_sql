# backup para win10
`sudo -u postgres pg_dump tigre > tigre.bkp`
`sudo -u postgres pg_dump leao > leao.bkp`

# examples para backup e restore
`sudo -u postgres pg_dump -Fc tigre > tigre.sql`[backup base]
`sudo -u postgres dropdb centroinfo`[apaga base]
`sudo -u postgres createdb -O postgres centroinfo`[cria base]
`sudo -u postgres pg_restore -d centroinfo < tigre.sql`[restore base]


# bkp example Boso Treianmentos
`sudo -u postgres pg_dump centroinfo > db_test.bkp`[ok]

# criar super usuários no postgres `createuser -dPs novouser`

`psql -h postgresql-143227-0.cloudclusters.net -p 19814 -U ademir -d centroinfo`

# backup e restore da base centroinfo no easyCluster e no debian [X]
`pg_dump -U ademir -d centroinfo -F c -b -v -f centroinfo.bkp`[backup cloud cluster centroinfo][ok] 
`pg_restore -U ademir -d centroinfo -v -c centroinfo.bkp`[restore base centroinfo na nuvem][ok]
`sudo -u postgres pg_restore -d centroinfo < centroinfo.bkp`[restore base centroinfo no debian DEV][ok]

