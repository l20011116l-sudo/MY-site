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

## 让别人通过网址访问（部署）

任选其一即可：

| 平台 | 做法概要 |
| --- | --- |
| **GitHub Pages** | 新建仓库，上传本文件夹内容（或推送 Git），在仓库 Settings → Pages 里选分支与 `/ (root)`，保存后得到 `https://<用户>.github.io/<仓库>/`。 |
| **Cloudflare Pages** | 连接 Git 仓库，构建命令留空，输出目录选仓库根（若整库只有 `personal-site`，则把该文件夹设为根目录或单独建仓库）。 |
| **Vercel / Netlify** | 同样作为静态站点导入，无需构建命令。 |

部署完成后，把平台提供的 **HTTPS 公开 URL** 发给朋友即可在浏览器直接打开。

## 自定义内容

- **署名 / 标题**：各页搜索替换 `蒋诚林`，并改 `<title>` 与 `meta description`。
- **新文章**：复制 `posts/example.html`，改文件名与正文；在 `blog.html` 与 `index.html` 增加列表项或卡片链接。
- **配色与字体**：编辑 `css/style.css` 顶部 `:root` 变量。

## 目录结构

```
personal-site/
├── index.html
├── blog.html
├── work.html
├── about.html
├── css/style.css
├── js/main.js
├── posts/example.html
└── README.md
```
