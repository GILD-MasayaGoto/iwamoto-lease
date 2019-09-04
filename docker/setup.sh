#!bin/bash

SSL_CLIENT_PATH=~/_projects/iwamoto-lease/docker/servers/web/etc/nginx/ssl/client
rm -rf $SSL_CLIENT_PATH
mkdir -p $SSL_CLIENT_PATH
openssl genrsa 2048 > $SSL_CLIENT_PATH/server.key
openssl req -new -key $SSL_CLIENT_PATH/server.key -subj "/C=JP/ST=Tokyo/L=Shibuya-ku/O=GILD,Inc./OU=System/CN=local.iwamoto-lease.jp" > $SSL_CLIENT_PATH/server.csr
openssl x509 -in $SSL_CLIENT_PATH/server.csr -days 3650 -req -signkey $SSL_CLIENT_PATH/server.key > $SSL_CLIENT_PATH/server.crt
chmod 400 $SSL_CLIENT_PATH/server.key
rm -rf $SSL_CLIENT_PATH/server.csr

SSL_API_PATH=~/_projects/iwamoto-lease/docker/servers/web/etc/nginx/ssl/api
rm -rf $SSL_API_PATH
mkdir -p $SSL_API_PATH
openssl genrsa 2048 > $SSL_API_PATH/server.key
openssl req -new -key $SSL_API_PATH/server.key -subj "/C=JP/ST=Tokyo/L=Shibuya-ku/O=GILD,Inc./OU=System/CN=local.iwamoto-lease.jp" > $SSL_API_PATH/server.csr
openssl x509 -in $SSL_API_PATH/server.csr -days 3650 -req -signkey $SSL_API_PATH/server.key > $SSL_API_PATH/server.crt
chmod 400 $SSL_API_PATH/server.key

API_PROJECT_PATH=~/_projects/iwamoto-lease/src/iwamoto-lease-api
cd $API_PROJECT_PATH
composer update
cp $API_PROJECT_PATH/.env.example $API_PROJECT_PATH/.env
php $API_PROJECT_PATH/artisan key:generate
chmod -R 777 $API_PROJECT_PATH/storage
chmod -R 777 $API_PROJECT_PATH/bootstrap/cache


CLIENT_PROJECT_PATH=~/_projects/iwamoto-lease/src/iwamoto-lease-client
cd $CLIENT_PROJECT_PATH
composer update
yarn install # yarnない場合、npm install に修正して

docker-sync start
docker-compose up -d

echo https://local.iwamoto-lease.jp:56050
echo https://local.api.iwamoto-lease.jp:56050/test
