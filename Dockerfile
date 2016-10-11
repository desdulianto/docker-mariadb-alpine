FROM alpine

RUN apk update -f && apk add mariadb -f
RUN echo -e "[mysqld]\nuser=mysql" >> /etc/mysql/my.cnf
RUN /usr/bin/mysql_install_db
RUN mkdir /run/mysqld
RUN chown mysql:mysql /run/mysqld
COPY entrypoint.sh /usr/local/bin

EXPOSE 3306
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
