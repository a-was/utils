SELECT user, host FROM mysql.user;

CREATE USER 'user'@'%' IDENTIFIED BY 'password';

-- WITH GRANT OPTION allows users to grant their privileges to other users (at most the same privilege level)
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION;
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT on database.* TO 'user'@'%' WITH GRANT OPTION;
GRANT SELECT on database.* TO 'user'@'%';

-- !
FLUSH PRIVILEGES;

ALTER USER 'user'@'localhost' IDENTIFIED BY 'new_password';

SHOW GRANTS;
SHOW GRANTS FOR 'user'@'%';

REVOKE type_of_permission ON database_name.table_name FROM 'user'@'%';
FLUSH PRIVILEGES;

DROP USER 'user'@'%';
