FROM keymetrics/pm2:latest-alpine

LABEL description="Automatically deploy nodejs"

# 环境变量
ENV MYPATH /apps/koa-koa
# 设置时区为中国标准时间
ENV TZ=Asia/Shanghai

# 镜像工作目录 -
WORKDIR $MYPATH

# 将当前目录下的所有文件（除了.dockerignore排除的路径），都拷贝进入 image 文件的/apps/koa-koa目录。
COPY . /apps/koa-koa

# 执行命令 安装依赖
RUN npm install --registry=https://registry.npm.taobao.org --production
RUN ls -al -R
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 暴露端口
EXPOSE 5000

CMD [ "pm2-runtime", "start", "koatest.json"]