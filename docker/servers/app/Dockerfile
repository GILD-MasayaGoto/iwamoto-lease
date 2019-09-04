FROM amazonlinux:2

# システムアップデートと時刻の設定
RUN yum update -y

# システムの言語を日本語に対応させる
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    echo -e 'ZONE="Asia/Tokyo"\nUTC=true' | tee /etc/sysconfig/clock \
    echo "LANG=ja_JP.UTF-8" | tee /etc/sysconfig/i18n

# 必要リポジトリの有効化
RUN yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

# 諸々インストール
RUN amazon-linux-extras install -y vim
RUN amazon-linux-extras install -y php7.3
RUN yum install -y php php-devel php-mbstring php-xml
RUN yum install -y mysql
RUN amazon-linux-extras install -y epel

# php-iniのバックアップ
RUN cp /etc/php.ini /etc/php.ini.default

# PHPの書き込みが必要なフォルダの権限を変更
RUN chmod 777 /var/lib/php/session/

# php-fpmをフォアグラウンドで実行
ENTRYPOINT /usr/sbin/php-fpm -F
