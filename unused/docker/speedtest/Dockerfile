#
# Compile
#

FROM node:10-alpine as build

RUN apk add --no-cache git
WORKDIR /src

RUN git clone https://github.com/atribe/Speedtest-for-InfluxDB-and-Grafana.git . && \
    git checkout master

#
# Deploy
#

FROM arm32v6/python:alpine

WORKDIR /src

COPY --from=build /src /src

RUN pip install -r requirements.txt

CMD ["python", "-u", "/src/influxspeedtest.py"]