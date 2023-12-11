#!/usr/bin/env

docker compose rm ldio-workbench --stop --force --volumes;
docker compose down;

export HOSTNAME=$(hostname);
export LDES_SERVER_BASE=http://${HOSTNAME}:8080/ldes;
export LDES_SERVER_ADMIN_BASE=http://${HOSTNAME}:8080/ldes ;
mkdir -p ./server/tmp/epsg;
chmod -R 0777 ./server/tmp;
chmod +x ./server/seed/seed.sh;

sh ./telraam_key.sh;

docker compose up -d;
while ! docker logs $(docker ps -q -f "name=ldes-server$") 2> /dev/null | grep 'Cancelled mongock lock daemon' ; do sleep 1; done;
sh ./server/seed/seed.sh;
sh ./server/seed/seed.metadata.sh;
docker compose up ldio-workbench -d;
while ! docker logs $(docker ps -q -f "name=ldio-workbench$") 2> /dev/null | grep 'Started Application in' ; do sleep 1; done;
#curl -s -H "x-api-key: ${TELRAAM_KEY}" https://telraam-api.net/v1/reports/traffic_snapshot_live > ./server/tmp/data.json;
#curl -H "Content-Type: application/json" http://${HOSTNAME}:8081/traffic-pipeline -d @./server/tmp/data.json;

curl -H "Content-Type: application/json" http://${HOSTNAME}:8081/traffic-pipeline -d @./examples/traffic.json;