#!/usr/bin/env bash
app_name='taco-cloud'
docker stop ${app_name}
echo '----stop container----'
docker rm ${app_name}
echo '----rm container----'
docker run -p 8883:8883 --name ${app_name} \
--link mysql:db \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/${app_name}/logs:/var/logs \
-d zc/${app_name}:0.0.1-SNAPSHOT
echo '----start container----'