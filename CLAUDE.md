# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal blog and portfolio site for Quentin Pleplé, built with Jekyll. Hosted at qpleple.com.

## Common Commands

```bash
# Local development - serve with live reload
jekyll serve

# Build the site (outputs to _site/)
jekyll build

# Deploy (builds, commits, and pushes both source and _site)
./deploy.sh
```

## Architecture

- **Jekyll static site generator** with posts in `_posts/` using markdown
- **Layouts**: `default.html` (base), `post.html` (blog posts), `page.html` (static pages)
- **_site/**: Generated output directory (tracked separately for GitHub Pages deployment)
- **CSS**: Poole/Lanyon theme (`css/poole.css`, `css/lanyon.css`) with custom styles in `css/style.css`

## Post Format

Posts use the naming convention `YYYY-MM-DD-slug.md` with front matter:
```yaml
---
layout: post
title: "Post Title"
categories: [optional, mathjax]  # mathjax enables LaTeX rendering
outdated: true  # optional, shows warning banner for old content
---
```

## Configuration

- `_config.yml`: Site title, URL (qpleple.com), permalink structure (`/:title/`)
- `display_posts_after`: Date filter for which posts appear on homepage
- Disqus comments enabled on all posts
