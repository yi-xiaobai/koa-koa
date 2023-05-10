FROM node:14.19.1

LABEL description="Automatically deploy nodejs"

# 环境变量
ENV MYPATH /apps/koa-koa

# 镜像工作目录
WORKDIR $MYPATH

# 将当前目录下的所有文件（除了.dockerignore排除的路径），都拷贝进入 image 文件的/apps/koa-koa目录。
COPY . /apps/koa-koa

# 执行命令 安装依赖
RUN npm install --registry=https://registry.npm.taobao.org
RUN npm install -g pm2

# 暴露端口
EXPOSE 5000

CMD pm2 restart koatest.json