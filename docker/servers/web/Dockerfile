FROM amazonlinux:2

# システムアップデートと時刻の設定
RUN yum update -y

# システムの言語を日本語に対応させる
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    echo -e 'ZONE="Asia/Tokyo"\nUTC=true' | tee /etc/sysconfig/clock \
    echo "LANG=ja_JP.UTF-8" | tee /etc/sysconfig/i18n

# 諸々インストール
RUN amazon-linux-extras install -y vim
RUN amazon-linux-extras install -y nginx1.12

RUN mkdir -p /etc/nginx/ssl/

# サイトのデータを置くフォルダを作成し、実行権限を変更
RUN mkdir -p /var/www/html/ \
    && chmod 755 -R /var/www/html

# nginxをフォアグラウンドで立ち上げる
ENTRYPOINT /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
