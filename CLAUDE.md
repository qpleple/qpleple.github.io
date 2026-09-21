# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal blog and portfolio site for Quentin Pleplé, built with Jekyll. Hosted at qpleple.com.

## Common Commands

```bash
# Install dependencies
bundle install

# Local development - serve with live reload at http://localhost:4000
bundle exec jekyll serve   # or: make serve

# Build the site locally (outputs to _site/, which is gitignored)
bundle exec jekyll build   # or: make build
```

## Deployment

**Building and deploying is done entirely by GitHub Actions. There is no manual
deploy path, and nothing built is ever committed to this repo.**

Every push to `master` runs `.github/workflows/deploy.yml`, which:
1. checks out the source and installs the gem versions pinned in `Gemfile.lock`,
2. runs `bundle exec jekyll build` with `JEKYLL_ENV=production`,
3. force-pushes the resulting `_site/` to the `master` branch of
   `qpleple/qpleple.github.io` via `peaceiris/actions-gh-pages` (`force_orphan: true`,
   so the published repo keeps a single-commit history).

The workflow needs a `DEPLOY_TOKEN` repository secret: a token with write access to
`qpleple.github.io`. It can also be run by hand from the Actions tab
(`workflow_dispatch`), and concurrent deploys are cancelled in favour of the newest push.

Typical flow: push a branch, open a PR, merge it to `master`, and the site is live a
minute or two later. Locally, `bundle exec jekyll build` is only for previewing — never
commit `_site/`.

## Dependencies

`Gemfile.lock` is committed, so local builds and CI use identical gem versions.
To pick up new gem releases, run `bundle update` and commit the resulting lockfile —
that upgrade is then visible in a diff instead of happening silently on the next deploy.

## Architecture

- **Jekyll static site generator** with posts in `_posts/` using markdown
- **Layouts**: `default.html` (base), `post.html` (blog posts), `page.html` (static pages)
- **_site/**: Jekyll build output. Gitignored, produced by CI, never committed here
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
