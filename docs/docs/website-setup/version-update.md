---
sidebar_position: 13
---

# New Version Update

Follow these steps to update to a new version of the web app. Choose deployment based on whether your site is configured with SEO or without SEO.

1. **Extract the ZIP File**:
   Extract the ZIP file containing the web code that you received from Codecanyon.

2. **Open the Code in VS Code**:
   Open the extracted web code in Visual Studio Code (VS Code).

3. **Edit the .env File**:
   Locate and open the .env file in your code editor. Add the admin URL as specified in the documentation.

4. **Configure Firebase**:
   Open the Firebase Console. Follow the steps outlined in the Firebase documentation. Add the Firebase details to the .env file of your web project.

5. **Install Dependencies**:
   Run the following command to install the necessary dependencies:

   ```bash
   npm install
   ```

6. **Choose your deployment option**:

   ### Option A: Without SEO (static export)
   - Build the project locally (generates `out` folder):

     ```bash
     npm run export
     ```

   - Upload the contents of the `out` folder to your domain's public directory (e.g., `public_html`).

   ### Option B: With SEO (build on server)
   - Upload your updated source code to the server.
   - On your VPS, install dependencies and build on the server (this keeps SEO behavior intact):

     ```bash
     npm run build
     ```

   - If you're already using PM2, you do not need to create a new PM2 app. Simply restart the existing PM2 process after the build so the update takes effect:

     ```bash
     pm2 restart <your-existing-process-name>
     ```

   - Or restart by process ID:

     1. List processes and note the ID:

        ```bash
        pm2 ls
        ```

     2. Restart using the ID (example uses ID 0):

        ```bash
        pm2 restart 0
        ```

7. **Need more details?**

- For the full SEO (VPS) deployment flow, see: [Next.js Deployment](./nextjs-deployment.md)
- For static hosting without SEO, see: [Deployment Without SEO](./deployment-without-seo.md)
