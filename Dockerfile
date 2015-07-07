FROM mongo
MAINTAINER Erwin Haas <erwin@wearelandscape.nl>

RUN apt-get update && \
    apt-get install -y cron && \
    rm -rf /var/lib/apt/lists/*

ADD backup.sh /backup.sh
RUN chmod +x /backup.sh

ADD start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /backup

ENTRYPOINT ["/start.sh"]
CMD [""]
