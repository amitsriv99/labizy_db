# labizy_user_db

### Install MySQL using rpm
https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/

Use the following MySQL rpm --> install/linux/rpm mysql57-community-release-el6-9.noarch.rpm

### Change root user's password as the very next step after the installation
/usr/bin/mysqladmin -u root password 'your secret root password'

### Allowing connection from remote
SHELL> /usr/bin/mysql -u root -p

MYSQL> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'your secret root password' WITH GRANT OPTION;
MYSQL> FLUSH PRIVILEGES;
MYSQL> exit;

Note: THIS IS DANGEROUS..! Instead of % provide the specific IP from where you want to access the MySQL server with root user account. 

If you're still not able to connect from remote, find the MySQL config file 
SHELL> sudo find / -type f -name "my.cnf" 2> /dev/null 

Find the line that says the following and comment it out..
	bind-address = 127.0.0.1 
SHELL> sudo service mysql restart

### Granting priviledges to admin and app user
MYSQL> GRANT ALL PRIVILEGES ON *.* TO 'labizy_admin'@'localhost' IDENTIFIED BY 'secret password' WITH GRANT OPTION;
MYSQL> FLUSH PRIVILEGES;
MYSQL> SHOW GRANTS FOR 'labizy_admin'@'localhost'; 

MYSQL> GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES ON *.* TO 'labizy_user'@'localhost' IDENTIFIED BY 'secret passowrd' WITH GRANT OPTION;
MYSQL> FLUSH PRIVILEGES;
MYSQL> SHOW GRANTS FOR 'labizy_user'@'localhost'; 
