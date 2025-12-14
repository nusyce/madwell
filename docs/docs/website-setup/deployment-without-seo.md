---
sidebar_position: 7
---

# Deployment Without SEO

If you don't require SEO functionality, you can deploy your eDemand web application on a standard shared hosting server using this simplified approach.

## Building Your Application

After making all necessary changes to your web application:

1. Open VS Code terminal by pressing `CTRL+J` in Windows/Linux or `CMD+J` in macOS
2. Run the following command to build your application:

```bash
npm run export
```

This command will take a few seconds to build the live and optimized version of your web application.

## Output Files

After the build process completes:

1. Navigate to the `out` folder in your project directory
2. This folder contains all the files needed for deployment
3. **Important:** Only upload files from the `out` folder to your server

## Uploading to Your Server

You can use any FTP client (like FileZilla) or your hosting control panel to upload the files:

1. Connect to your hosting server
2. Navigate to the public directory (often named `public_html`, `www`, or `htdocs`)
3. Upload all files and folders from the `out` directory
4. Maintain the same folder structure as in the `out` directory

## Adding the .htaccess File (Important for URL Rewriting)

After uploading the contents of the `out` folder, you also need to add a `.htaccess` file to the **same directory** (e.g., `public_html`). This file handles URL rewriting to make sure your application's routing works correctly on Apache servers.

1.  **Create a new file** named `.htaccess` (note the dot at the beginning) in the root of your deployment directory (the same place you uploaded the `out` folder contents).
2.  **Copy and paste** the following code into the `.htaccess` file:

    ```apache
    <IfModule mod_rewrite.c>
      RewriteEngine On
      RewriteBase /

      # Enable symlinks
      Options +FollowSymLinks

      # If the request is for a file that exists, serve it directly
      RewriteCond %{REQUEST_FILENAME} -f [OR]
      RewriteCond %{REQUEST_FILENAME} -d
      RewriteRule ^ - [L]

      # Handle Next.js static files and assets
      RewriteRule ^_next/(.*)$ _next/$1 [L]
      RewriteRule ^static/(.*)$ static/$1 [L]
      RewriteRule ^manifest\.json$ manifest.json [L]

      # Test rule for search - redirect to actual file
      RewriteRule ^search/([^/]+)/?$ search/[slug].html [L]

      # Test rule for service
      RewriteRule ^service/(.*)/?$ service/[...slug].html [L]

      # Test rule for booking
      RewriteRule ^booking/(.*)/?$ booking/[...slug].html [L]

      # Test rule for provider-details
      RewriteRule ^provider-details/(.*)/?$ provider-details/[...slug].html [L]

      # Test rule for my-service-request-details
      RewriteRule ^my-service-request-details/(.*)/?$ my-service-request-details/[...slug].html [L]

      # Test rule for blog-details
      RewriteRule ^blog-details/([^/]+)/?$ blog-details/[slug].html [L]

      # Handle static HTML files
      RewriteCond %{REQUEST_FILENAME} !-f
      RewriteCond %{REQUEST_FILENAME} !-d
      RewriteCond %{DOCUMENT_ROOT}/$1.html -f
      RewriteRule ^([^/]+)/?$ $1.html [L]

      # Handle directory index files
      RewriteCond %{REQUEST_FILENAME} !-f
      RewriteCond %{REQUEST_FILENAME} !-d
      RewriteCond %{DOCUMENT_ROOT}/$1/index.html -f
      RewriteRule ^([^/]+)/?$ $1/index.html [L]

      # Final fallback to 404 page
      RewriteCond %{REQUEST_FILENAME} !-f
      RewriteCond %{REQUEST_FILENAME} !-d
      RewriteRule ^ 404.html [L]
    </IfModule>
    ```

Alternatively, you can [view the raw .htaccess content here](/files/htaccess-example.txt) (opens in a new tab) to copy or save it.

3.  **Save the file** on your server.

:::tip Note
This `.htaccess` configuration is typically provided with the eDemand web code. If you already have this file from the source code, you can upload that one directly instead of creating a new one.
:::

## Configuring Your Domain

Once all files are uploaded:

1. Point your domain to the directory containing the uploaded files
2. If necessary, configure your DNS settings to point to your hosting server
3. Wait for DNS propagation (can take up to 24-48 hours)

## Testing Your Deployment

After deployment:

1. Visit your website using your domain name
2. Verify that all pages load correctly
3. Test all functionality (search, user registration, login, etc.)
4. Check that all assets (images, styles, scripts) are loading properly

## Troubleshooting

If you encounter issues:

- Check your server error logs
- Verify that all files were uploaded correctly
- Ensure your hosting environment supports modern JavaScript applications
- Check if any server configuration is blocking your application (e.g., `.htaccess` rules)

## Additional Resources

For more detailed information about Next.js deployment, refer to the [official Next.js deployment documentation](https://nextjs.org/docs/pages/building-your-application/deploying).
