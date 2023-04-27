FROM ubuntu:20.04
MAINTAINER sureshj98505983@gmall.com
RUN apt-get -y update && apt-get install -yq tzdata && ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
RUN apt-get -y install nginx
RUN apt-get -y install php-fpm
RUN apt-get -y install supervisor
ADD index.php /var/www/html
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD default /etc/nginx/sites-available/default
EXPOSE 80/tcp
CMD ["/usr/bin/supervisord"]
