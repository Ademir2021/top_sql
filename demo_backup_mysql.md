# Backup databases mysql
- sudo mysqldump db_vendas > backup_db_vendas.sql

# Restore databases mysql
- sudo sudo mysql centroinfo  < centroinfo.sql

# Backup databases pgsql
- sudo -u postgres pg_dump > leao.sql