#/bin/bash

/speedtest/speedtest --accept-license --accept-gdpr -f json | nc logstash 8080;
