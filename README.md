# 个人站点（博客 + 作品集）

纯静态 HTML/CSS/JS，无构建步骤。视觉取向：**清水混凝土般的灰阶、几何分割、侧向窄「光缝」**，适合作为日常思考与技术笔记的展示页。

## 本地预览

**推荐**在 `personal-site` 目录下启动，这样根路径就是网站首页：

```bash
cd personal-site
python3 -m http.server 8080
```

浏览器打开：`http://127.0.0.1:8080/` 或 `http://localhost:8080/`

若你在**上一级仓库根目录**（`鸭哥harness engineering`）执行了 `python3 -m http.server 8080`，原先访问 `/` 只会看到文件夹列表、**没有**自动进个人站。仓库根目录已增加 `index.html`，会**跳转到** `http://127.0.0.1:8080/personal-site/`；也可手动打开该地址。

不建议用「双击 `index.html`」用 `file://` 打开：外链字体可能异常，相对路径在子页面也可能不一致；请尽量用上面的本地 HTTP 方式。

## 最小成本上线（GitHub Pages，免费）

本目录已在本地初始化好 Git（`main` 分支）。你只需要在 GitHub 上建一个**空仓库**并把代码推上去，再打开 Pages 开关。

### 1. 在 GitHub 新建仓库

1. 登录 [GitHub](https://github.com)，点 **New repository**。
2. **Repository name** 填一个名字，例如 `my-site`（或下文「根域名」说明里的特殊名字）。
3. **不要**勾选 README、.gitignore、license（保持空仓库，避免第一次推送冲突）。
4. 点 **Create repository**。

### 2. 本地推送（把下面 URL 换成你的仓库地址）

在终端执行：

```bash
cd "/Users/chenglinjiang/Downloads/鸭哥harness engineering/personal-site"
git remote add origin https://github.com/<你的用户名>/<仓库名>.git
git push -u origin main
```

若提示登录：按 GitHub 当前要求使用 **HTTPS + Personal Access Token** 或 **SSH**（仓库页有切换说明）。

### 3. 打开 GitHub Pages

1. 打开该仓库 → **Settings** → 左侧 **Pages**。
2. **Build and deployment** → **Source** 选 **Deploy from a branch**。
3. **Branch** 选 **main**，文件夹选 **/ (root)** → **Save**。

等待几分钟，页面顶部或 Actions 里会显示站点地址。一般为：

- 仓库名**任意**时：`https://<你的用户名>.github.io/<仓库名>/`
- 若仓库名恰好是 **`你的用户名.github.io`**（且仓库里是站点根目录），则首页为：`https://<你的用户名>.github.io/`（无子路径）。

本站所有链接均为**相对路径**，放在子路径 `/<仓库名>/` 下也能正常打开。

### 4. 以后更新

改完文件后：

```bash
cd "/Users/chenglinjiang/Downloads/鸭哥harness engineering/personal-site"
git add -A && git commit -m "更新内容" && git push
```

推送后等 1～2 分钟，刷新线上页面即可。

---

### 其他托管（可选）

| 平台 | 做法概要 |
| --- | --- |
| **Cloudflare Pages** | 连接 Git 仓库，构建命令留空，输出目录为仓库根。 |
| **Vercel / Netlify** | 导入同一仓库，静态站点、无需构建。 |

## 自定义内容

- **署名 / 标题**：各页搜索替换 `蒋诚林`，并改 `<title>` 与 `meta description`。
- **新文章**：复制 `posts/example.html`，改文件名与正文；在 `blog.html` 与 `index.html` 增加列表项或卡片链接。
- **配色与字体**：编辑 `css/style.css` 顶部 `:root` 变量。

## 目录结构

```
personal-site/
├── .nojekyll          # 让 GitHub Pages 不按 Jekyll 处理，避免意外忽略文件
├── index.html
├── blog.html
├── work.html
├── about.html
├── css/style.css
├── js/main.js
├── posts/example.html
└── README.md
```
