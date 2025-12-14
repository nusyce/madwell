---
sidebar_position: 9
---

# Sitemap Setup

A sitemap helps search engines discover and index all the pages on your website. This guide explains how to set up a sitemap for your eDemand web application.

## Step 1: Configure Your Domain

1. Open the `.env` file in your project's root directory

2. Add your website URL:

```env
NEXT_PUBLIC_WEB_URL=https://yourdomain.com
```

3. (Optional) If you're using VPS hosting with Node.js, enable SEO mode:

```env
NEXT_PUBLIC_ENABLE_SEO=true
```

If you're using shared hosting or static export, leave this unset or set to `false`.

## Step 2: Generate the Sitemap

The sitemap is automatically generated when you build or run your project. Choose the method that matches your hosting:

### Option 1: Shared Hosting (Static Export)

Build your site for static hosting:

```bash
npm run export
```

This creates the sitemap file at `public/sitemap.xml` which you can deploy with your site.

### Option 2: VPS Hosting (Server-Side)

Build your project on your VPS:

```bash
npm run build
```

The sitemap will be generated automatically and served at `/sitemap.xml` when your site is running.

### Option 3: Manual Generation

If you only need to generate the sitemap without building:

```bash
npm run generate-sitemap
```

This creates `public/sitemap.xml` file.

## How It Works

The sitemap system works in two ways depending on your configuration:

**When SEO is enabled** (`NEXT_PUBLIC_ENABLE_SEO="true"`):
- Sitemap is generated dynamically on each request
- Always includes the latest content from your API
- Best for VPS hosting with Node.js

**When SEO is disabled** (default or `NEXT_PUBLIC_ENABLE_SEO="false"`):
- Sitemap is generated as a static XML file
- Saved to `public/sitemap.xml`
- Best for shared hosting or static exports

The sitemap automatically includes:
- All static pages (home, about, contact, etc.)
- Dynamic pages from your API (services, providers, blogs)
- Multi-language versions of all pages

## Step 3: Verify Your Sitemap

After deploying your site, visit:

```
https://yourdomain.com/sitemap.xml
```

You should see an XML file with all your website URLs.

## Step 4: Submit to Search Engines

Submit your sitemap to search engines:

1. **Google Search Console**: https://search.google.com/search-console
   - Add your property
   - Go to Sitemaps section
   - Submit: `https://yourdomain.com/sitemap.xml`

2. **Bing Webmaster Tools**: https://www.bing.com/webmasters
   - Add your site
   - Submit sitemap: `https://yourdomain.com/sitemap.xml`

That's it! Your sitemap is now set up and submitted to search engines.
