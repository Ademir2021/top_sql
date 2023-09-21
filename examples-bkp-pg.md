# backup para win10
`sudo -u postgres pg_dump tigre > tigre.bkp`
`sudo -u postgres pg_dump leao > leao.bkp`

# examples para backup e restore
`sudo -u postgres pg_dump -Fc tigre > tigre.sql`[backup base]
`sudo -u postgres dropdb test`[apaga base]
`sudo -u postgres createdb -O postgres test`[cria base]
`sudo -u postgres pg_restore -d test < tigre.sql`[restore base]


# bkp example Boso Treianmentos
`sudo -u postgres pg_dump test > db_test.bkp`[ok]

# criar super usuários no postgres `createuser -dPs novouser`

`psql -h postgresql-143227-0.cloudclusters.net -p 19814 -U ademir -d test`

# backup da base centroinfo no easyCluster
`pg_dump -U ademir -d test -F c -b -v -f test.bkp`[backup base cloud cluster centroinfo][ok] 
`pg_restore -U ademir -d test -v -c test.bkp`[restore base centroinfo no debian DEV][nao funciomou]
`sudo -u postgres pg_restore -d test < test.bkp`[restore base centroinfo no debian DEV][ok]

