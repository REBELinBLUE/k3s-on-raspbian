## Speedtest

```bash
cd speedtest

docker build -f Dockerfile \
    -t rebelinblue/speedtest-for-influxdb-and-grafana:latest .

docker push rebelinblue/speedtest-for-influxdb-and-grafana
```