FROM ubuntu:18.04
WORKDIR /map-repo
RUN apt-get update && apt-get install -y \
    rsync \
    cron
COPY sync.sh /map-repo
COPY crontab /etc/cron.d/
RUN chmod 0644 /etc/cron.d/crontab \
  && crontab /etc/cron.d/crontab
CMD ["cron", "-f"]
