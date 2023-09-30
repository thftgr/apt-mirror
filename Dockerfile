FROM ubuntu:22.04

RUN apt-get update && apt-get install -y apt-mirror nginx wget dpkg ca-certificates cron

COPY mirror.list /etc/apt/mirror.list
COPY run.sh /run.sh

RUN ln -s /var/spool/apt-mirror/mirror/archive.ubuntu.com/ubuntu /var/www/html/ubuntu

#RUN (crontab -l 2>/dev/null; echo '0 * * * * apt-mirror > /var/log/apt-mirror.log 2>&1') | crontab -
RUN cron


VOLUME ["/apt-mirror"]
EXPOSE 80

CMD ["/run.sh"]