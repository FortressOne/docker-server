FROM ubuntu:18.04
WORKDIR /map-repo
RUN apt-get update && apt-get install -y \
  wget \
  unzip \
  rsync \
  cron
# RUN wget https://github.com/FortressOne/map-repo/releases/latest/download/map-repo.zip
ADD map-repo.zip /map-repo/map-repo.zip
RUN unzip map-repo.zip
RUN rm map-repo.zip
RUN rsync -atzv rsync://fortressone.quakerepo.net/maps .
ADD update-map-repo-crontab /etc/cron.d/update-map-repo-crontab
RUN chmod 0644 /etc/cron.d/update-map-repo-crontab
RUN crontab /etc/cron.d/update-map-repo-crontab
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log
