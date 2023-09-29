FROM fifilyu/centos7:latest

ENV TZ Asia/Shanghai
ENV LANG en_US.UTF-8

##############################################
# buildx有缓存，注意判断目录或文件是否已经存在
##############################################

####################
# 安装MySQL 5.7
####################
RUN ulimit -n 1024 && yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-7.noarch.rpm
RUN ulimit -n 1024 && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-mysql*
RUN ulimit -n 1024 && yum-config-manager --disable mysql-connectors-community | egrep '(\[mysql-connectors-community\])|enabled'
RUN ulimit -n 1024 && yum-config-manager --disable mysql-tools-community | egrep '(\[mysql-tools-community\])|enabled'
RUN ulimit -n 1024 && yum-config-manager --disable mysql80-community | egrep '(\[mysql80-community\])|enabled'
RUN ulimit -n 1024 && yum --enablerepo=mysql57-community install -y mysql-community-server
RUN mysqld --initialize
RUN chown -R mysql /var/lib/mysql

####################
# 清理
####################
RUN ulimit -n 1024 && yum clean all

####################
# 设置开机启动
####################
COPY file/usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

WORKDIR /root

EXPOSE 22
