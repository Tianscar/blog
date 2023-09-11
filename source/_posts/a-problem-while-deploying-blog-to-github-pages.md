---
title: 一个将博客部署到 GitHub Pages 遇到的问题
date: 2023-09-11 00:49:35
updated: 2023-09-11 00:49:35
category: 通知
tags: 博客装修
---

## 起因
GitHub Pages 如果定为 `gh-pages` 分支，有默认对 Jekyll 博客作出的配置。
因此我的 Hexo 博客的部分功能在本地运行没问题，而部署到 GitHub Pages 出现了问题（例如搜索框）。

## 解决方案
只要 `gh-pages` 分支的根目录有名为 `.nojekyll` 的文件，就不会应用那些可能导致问题的配置。
首先，在 `source` 目录中创建这个文件。

### Hexo
Hexo 生成博客网站的时候默认是不包含隐藏文件（*NIX上是 `.` 开头的文件）的。
在 `_config.yml` 配置
```yaml
include: .nojekyll
```
即可包含 `.nojekyll`。

### hexo-deployer-git
部署过程默认是不包含隐藏文件的。
在 `_config.yml` 配置
```yaml
ignore_hidden:
    public: false
```
