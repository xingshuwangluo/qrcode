#
# 7.2PHP-Apache
#


FROM php:7.2-apache

MAINTAINER Dongasai 1514582970@qq.com

#更新apt-get源 使用163的源
RUN echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib " >> /etc/apt/sources.list  && \
    echo "deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib " >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ stretch main non-free contrib " >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib " >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib " >> /etc/apt/sources.list  && \
    echo "deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib  " >> /etc/apt/sources.list  && \
    echo "deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib " >> /etc/apt/sources.list

RUN apt-get update;
RUN apt-get install -y git wget zip zlib1g-dev;
# 安装常用扩展,开启伪静态
RUN a2enmod rewrite;docker-php-ext-install pdo pdo_mysql;docker-php-ext-enable pdo pdo_mysql;

# 设置运行目录为public
COPY default.conf /etc/apache2/sites-enabled/000-default.conf


RUN docker-php-ext-install bcmath mbstring;

# 安装phalcon 版本
ENV PHALCON_VERSION=3.4.3
RUN curl -sSL "https://codeload.github.com/phalcon/cphalcon/tar.gz/v${PHALCON_VERSION}" | tar -xz \
    && cd cphalcon-${PHALCON_VERSION}/build \
    && ./install \
    && cp ../tests/_ci/phalcon.ini $(php-config --configure-options | grep -o "with-config-file-scan-dir=\([^ ]*\)" | awk -F'=' '{print $2}') \
    && cd ../../ \
    && rm -r cphalcon-${PHALCON_VERSION}
# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php;mv composer.phar /usr/local/bin/composer
# 安装phalcon 的开发工具包
WORKDIR /home
ENV PHALCON_DEVTOOL_VERSION=3.4.1
RUN curl -sSL "https://github.com/phalcon/phalcon-devtools/archive/v${PHALCON_DEVTOOL_VERSION}.tar.gz" | tar -xz \
    && cd phalcon-devtools-${PHALCON_DEVTOOL_VERSION} \
    && ./phalcon.sh \
    && ln -s /home/phalcon-devtools-3.4.1/phalcon.php /usr/bin/phalcon
#重置工作目录
WORKDIR /var/www/html
# 预部署
COPY composer.json /var/www/html/
COPY composer.lock /var/www/html/
RUN composer install

# 部署项目
COPY . /var/www/html/