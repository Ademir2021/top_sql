# backup
`sudo -u postgres pg_dump tigre > tigre.bkp`
`sudo -u postgres pg_dump leao > leao.bkp`

# examples para backup e restore
`sudo -u postgres pg_dump -Fc leao > leao.sql` --> backup
`sudo -u postgres dropdb test` --> apaga base
`sudo -u postgres createdb -O postgres test` --> cria base com um novo nome
`sudo -u postgres pg_restore -d test < leao.sql` --> restore base