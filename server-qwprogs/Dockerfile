FROM ubuntu:18.04
WORKDIR /server-qwprogs
RUN apt-get update && apt-get install -y \
    curl \
    cron
RUN mkdir /server-qwprogs/fortress
RUN curl -Lo /server-qwprogs/fortress/qwprogs.dat https://github.com/FortressOne/server-qwprogs/releases/latest/download/qwprogs.dat
COPY sync.sh /server-qwprogs
COPY crontab /etc/cron.d/
RUN chmod 0644 /etc/cron.d/crontab \
  && crontab /etc/cron.d/crontab
CMD ["cron", "-f"]
