# docker-centos7-mysql57

基于CentOS7 + MySQL57的Docker镜像

## CentOS7基础镜像

本项目基于 [docker-centos7](https://github.com/fifilyu/docker-centos7) 构建。

请访问 [docker-centos7](https://github.com/fifilyu/docker-centos7) 查看基本使用方法。

## 构建镜像

```bash
git clone https://github.com/fifilyu/docker-centos7-mysql57.git
cd docker-centos7-mysql57
docker buildx build -t fifilyu/centos7-mysql57:latest .
```

## 使用方法

### 启动容器

```bash
docker run -d \
    --env LANG=en_US.UTF-8 \
    --env TZ=Asia/Shanghai \
    -p 23306:3306 \
    --name mysql_foo \
    fifilyu/centos7-mysql57:latest
```

* MySQL主机地址：`localhost`
* MySQL主机端口：`23306`
* MySQL用户名称：`root`
* MySQL用户密码：(执行 `docker logs foobar` 命令查看默认密码)
* MySQL本地数据目录：`/data/mysql`

### 测试MySQL连接

```bash
mysql -h localhost -uroot -p默认密码 mysql -e 'select now();'
```