# seatunnel

```
docker run --rm -v ./demo.conf:/demo/conf ghcr.io/dream2zz/seatunnel:main /opt/seatunnel/bin/seatunnel.sh --config /demo/conf -e local
```

```
docker run -d --name mysql5 -p 3305:3306 -e MYSQL_HOST=% -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7

docker run --rm --network host -v ./m2m.conf:/demo/m2m ghcr.io/dream2zz/seatunnel:main /opt/seatunnel/bin/seatunnel.sh --config /demo/m2m -e local
```