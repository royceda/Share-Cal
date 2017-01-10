ENV MYSQL_ROOT_PASSWORD=root

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV GOSU_VERSION=1.7

ENV MARIADB_MAJOR=10.1

ENV MARIADB_VERSION=10.1.17+maria-1~jessie

EXPOSE 3306/tcp

VOLUME /var/lib/mysql


ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]
