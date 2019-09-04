-- mysql8のユーザー認証方式がcaching_sha2_passwordになっていて
-- Laravelも殆どのクライアントソフトも対応していないので従来の方式(mysql_native_password)に修正する。

-- mysql> SELECT user, host, plugin FROM mysql.user;
-- +------------------+-----------+-----------------------+
-- | user             | host      | plugin                |
-- +------------------+-----------+-----------------------+
-- | root             | %         | caching_sha2_password |
-- | mysql.infoschema | localhost | caching_sha2_password |
-- | mysql.session    | localhost | caching_sha2_password |
-- | mysql.sys        | localhost | caching_sha2_password |
-- | root             | localhost | caching_sha2_password |
-- +------------------+-----------+-----------------------+

-- ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
-- ALTER USER 'mysql.infoschema'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
-- ALTER USER 'mysql.session'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
-- ALTER USER 'mysql.sys'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

CREATE DATABASE IF NOT EXISTS `iwamoto-lease` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `iwamoto-lease`;