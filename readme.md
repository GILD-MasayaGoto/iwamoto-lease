docker-syncをいれておいてください。

step1
```
$ sudo vi /etc/hosts
# iwamoto-lease
127.0.0.1       local.iwamoto-lease.jp
127.0.0.1       local.api.iwamoto-lease.jp
```

step2
```
mkdir -p ~/_projects/
cd ~/_projects/
git clone git@github.com:GILD-MasayaGoto/iwamoto-lease.git iwamoto-lease
```

step3
```
. ~/_projects/iwamoto-lease/docker/setup.sh
```
