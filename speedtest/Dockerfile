FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    tar \
    gzip \
    curl \
    netcat-openbsd \
    cron \
    && rm -rf /var/lib/apt/lists/*

RUN /usr/sbin/update-ca-certificates

RUN mkdir -p /speedtest

WORKDIR /speedtest

COPY ookla-speedtest-1.2.0-linux-x86_64.tgz /speedtest/

RUN tar -xvzf ookla-speedtest-1.2.0-linux-x86_64.tgz

COPY ./run-speedtest.sh /speedtest/run-speedtest.sh

RUN chmod a+x run-speedtest.sh

RUN (crontab -l ; echo "*/2 * * * * /speedtest/run-speedtest.sh >> /dev/null 2>&1") | crontab

CMD ["cron", "-f"]