# <= centos7
FROM centos:latest

# Add the nginx repo
ADD settings/nginx/nginx.repo /etc/yum.repos.d/nginx.repo

# Installing nginx 
RUN yum -y install nginx

# Installing PHP
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# v5.6.7+
RUN yum install -y php56w php56w-opcache php56w-fpm php56w-mbstring php56w-mysql php56w-pdo php56w-pecl-memcache php56w-xml
RUN yum install -y yum-plugin-replace 

# Other configs / timezone, short tags, etc
COPY settings/php.d /etc/php.d

# Adding the configuration file of the nginx
COPY settings/nginx/conf.d /etc/nginx/conf.d
ADD  settings/nginx/nginx.conf /etc/nginx/nginx.conf