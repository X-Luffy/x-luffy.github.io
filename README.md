# Zhaoyuan Xia (夏照源) - Academic Homepage

Welcome to my academic homepage! This is a personal academic website built with GitHub Pages.

## Preview

Visit: https://x-luffy.github.io

## Features

- Clean and modern academic design
- Responsive layout (mobile-friendly)
- Sections for:
  - Personal introduction and education
  - Research interests (LLM, AI Agent, VLM, Benchmark)
  - Publications (GTR-Bench @ ICLR 2026)
  - Work experience (Baidu, SenseTime)
  - Projects
  - Contact information

---

## Deployment Guide (GitHub Pages 部署指南)

### Step 1: 在 GitHub 上创建仓库

1. 登录 GitHub，点击右上角 `+` → `New repository`
2. Repository name 填写: `x-luffy.github.io` (注意：必须和你自己的GitHub用户名一致)
3. 选择 `Public`
4. 点击 `Create repository`

### Step 2: 初始化 Git 并推送代码

```bash
# 进入项目目录
cd /home/xiazhaoyuan/code/x-luffy.github.io

# 初始化 git
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Academic homepage"

# 设置主分支名为 main
git branch -M main

# 添加远程仓库 (替换为你的 GitHub 用户名)
git remote add origin https://github.com/X-Luffy/x-luffy.github.io.git

# 推送代码
git push -u origin main
```

### Step 3: 启用 GitHub Pages

1. 进入 GitHub 仓库页面
2. 点击 `Settings` (设置)
3. 左侧菜单找到 `Pages`
4. 在 `Source` 部分:
   - Branch 选择 `main`
   - Folder 选择 `/ (root)`
5. 点击 `Save`

### Step 4: 访问你的网站

等待 1-2 分钟后，你的网站将会在以下地址可用:

**https://x-luffy.github.io**

你可以在 Pages 设置页面看到部署状态和访问链接。

---

## Customization (个性化定制)

### 更新个人信息

编辑 `index.html`，主要需要修改的内容:

1. **邮箱**: 搜索 `your.email@pku.edu.cn`，替换为你的真实邮箱
2. **Google Scholar**: 搜索 `https://scholar.google.com`，添加你的 Scholar 链接
3. **arXiv**: 搜索 `https://arxiv.org/a/`，更新你的 arXiv 作者页面

### 添加个人照片

1. 创建 `images` 文件夹并放入照片:
```bash
mkdir -p /home/xiazhaoyuan/code/x-luffy.github.io/images
# 将你的照片复制到 images/profile.jpg
```

2. 修改 `index.html` 中的 `hero-image` 部分:
```html
<div class="hero-image">
    <img src="images/profile.jpg" alt="Zhaoyuan Xia" class="profile-photo">
</div>
```

3. 在 `style.css` 中添加样式:
```css
.profile-photo {
    width: 300px;
    height: 300px;
    border-radius: 50%;
    object-fit: cover;
    box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1);
}

@media (max-width: 992px) {
    .profile-photo {
        width: 250px;
        height: 250px;
    }
}

@media (max-width: 480px) {
    .profile-photo {
        width: 200px;
        height: 200px;
    }
}
```

### 修改颜色主题

在 `style.css` 开头的 `:root` 部分修改:

```css
:root {
    --primary-color: #2563eb;      /* 主色调 */
    --primary-dark: #1e40af;       /* 深色 */
    --accent-color: #0ea5e9;       /* 强调色 */
    /* ... 其他颜色变量 */
}
```

---

## File Structure

```
x-luffy.github.io/
├── index.html      # 主页面
├── style.css       # 样式文件
├── README.md       # 说明文档
└── images/         # 图片目录 (可选)
    └── profile.jpg # 个人照片 (可选)
```

---

## Update Content (更新内容)

当你修改了内容后，重新推送:

```bash
cd /home/xiazhaoyuan/code/x-luffy.github.io
git add .
git commit -m "Update: 更新内容描述"
git push
```

GitHub Pages 会自动重新部署。

---

## Common Issues (常见问题)

### Q: 为什么网站无法访问？

1. 检查仓库名是否正确: `username.github.io`
2. 检查 Pages 设置是否正确启用
3. 等待 1-2 分钟让部署完成

### Q: 如何绑定自定义域名？

1. 在仓库根目录创建 `CNAME` 文件，内容为你的域名
2. 在域名服务商处添加 CNAME 记录指向 `x-luffy.github.io`
3. 在 Pages 设置中添加自定义域名

### Q: 如何添加更多论文？

在 `index.html` 的 `publications-list` 部分添加新的 `publication-item`:

```html
<div class="publication-item">
    <div class="pub-year">202X</div>
    <div class="pub-content">
        <h3>论文标题</h3>
        <p class="pub-authors">作者列表</p>
        <p class="pub-venue"><em>会议/期刊名称</em></p>
        <div class="pub-links">
            <a href="PDF链接" class="pub-link"><i class="fas fa-file-pdf"></i> PDF</a>
            <a href="代码链接" class="pub-link"><i class="fas fa-code"></i> Code</a>
        </div>
    </div>
</div>
```

---

## License

This project is open source and available under the MIT License.

---

Made with ❤️ by Zhaoyuan Xia
