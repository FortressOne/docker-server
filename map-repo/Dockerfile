FROM ubuntu:18.04
WORKDIR /map-repo
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    rsync \
    cron
RUN wget https://github.com/FortressOne/map-repo/releases/latest/download/map-repo.zip \
  && unzip map-repo.zip \
  && rm map-repo.zip
COPY sync.sh /map-repo
COPY crontab /etc/cron.d/
RUN chmod 0644 /etc/cron.d/crontab \
  && crontab /etc/cron.d/crontab
CMD ["cron", "-f"]
