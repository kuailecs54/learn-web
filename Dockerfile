# =========================================
# Stage 1: Build the Angular Application
# =========================================
# 使用官方 Node.js 运行时作为基础镜像
FROM node:22.16.0-alpine AS builder

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json（如果存在）
COPY package*.json ./

# 安装项目依赖
RUN npm ci --only=production

# 复制项目源代码
COPY . .

# 构建生产版本
RUN npm run build

# =========================================
# Stage 2: Serve with Nginx
# =========================================
# 使用 nginx 作为生产服务器
FROM nginx:alpine AS production

# 删除 nginx 默认页面
RUN rm -rf /usr/share/nginx/html/*

# 从构建阶段复制构建产物到 nginx 服务器目录 因为有workdir /app 所以路径要/app前缀
COPY --from=builder /app/dist/learn-web/browser /usr/share/nginx/html

# 复制 nginx 配置文件
COPY nginx.conf /etc/nginx/nginx.conf

# 暴露端口
EXPOSE 80

# 启动 nginx
CMD ["nginx", "-g", "daemon off;"]

# =========================================
# Stage 3: Development Image
# =========================================
FROM nginx:alpine AS development

# 删除 nginx 默认页面
RUN rm -rf /usr/share/nginx/html/*

# 从构建阶段复制构建产物到 nginx 服务器目录（开发配置）
COPY --from=builder /app/dist/learn-web/browser /usr/share/nginx/html

# 复制开发环境的 nginx 配置文件
COPY nginx.conf /etc/nginx/nginx.conf

# 暴露端口
EXPOSE 80

# 启动 nginx
CMD ["nginx", "-g", "daemon off;"]