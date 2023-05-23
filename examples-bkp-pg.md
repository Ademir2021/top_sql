# backup para win10
`sudo -u postgres pg_dump tigre > tigre.bkp`
`sudo -u postgres pg_dump leao > leao.bkp`

# examples para backup e restore
`sudo -u postgres pg_dump -Fc tigre > tigre.sql`[backup base]
`sudo -u postgres dropdb test`[apaga base]
`sudo -u postgres createdb -O postgres test`[cria base]
`sudo -u postgres pg_restore -d test < tigre.sql`[restore base]