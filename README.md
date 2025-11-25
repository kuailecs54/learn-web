# lean-web

教学系统介绍 作为主站访问使用 静态项目

## 技术栈
- **框架**: Angular 18.2
- **UI框架**: Angular Material + CDK
- **响应式布局**: Angular Flex-Layout
- **样式**: SCSS + Tailwind CSS
- **动画**: @angular/animations
- **粒子特效**: tsparticles

## 项目结构
```
src/
├── app/
│   ├── core/layout/       # 全局布局组件：header, footer
│   ├── features/          # 功能页面组件：home, courses, about
│   ├── shared/directives/ # 共享指令：scroll-animation
│   ├── app.component.*    # 根组件
│   ├── app.routes.ts      # 路由配置
│   └── app.config.ts      # 应用配置
├── index.html             # 主HTML入口
├── main.ts                # 应用启动文件
└── styles.scss            # 全局样式（含Tailwind）
```

## 开发环境搭建
1. 安装 Node.js (推荐 LTS 版本)
2. 安装项目依赖：
   ```bash
   npm install
   ```

## 项目运行命令
### 开发环境
- 启动开发服务器：`npm start` 或 `ng serve`
- 访问地址：http://localhost:4200/

### 构建项目
- 开发构建：`ng build`
- 生产构建：`ng build --prod`
- 自定义路径构建：`ng build --prod --base-href /learn-web/

### 测试
- 单元测试：`ng test`
- 端到端测试：`ng e2e`

## Docker部署
### 构建镜像
```bash
docker build -t lean-web .
```

### 运行容器
```bash
docker run -d -p 8080:80 lean-web
```
访问地址：http://localhost:8080/

## UI规范
- 参考目录中的PPT文件作为展示参考和UI展现
- 固定的顶部菜单栏和底部网站信息说明、版权信息等
- 界面要求现代时尚