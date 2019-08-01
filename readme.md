# Qrcode

> 长文本二维码生成器,将很长的文本(最长4294967295字节)生成一个小二维码,便于分享


## 依赖

* 依赖docker,docker-compose
* 具体PHP依赖详见Dockerfile

## 安装 

1. clone 代码
2. 导入数据库(本目录的qrcode.sql文件)到mysql
3. 修改生成 .env 环境变量(复制 .env.example ) 
4. 在本目录进行docker镜像构建 `docker-compose build`
5. 在本目录进行docker-compose 编排启动 `docker-compose up -d`

