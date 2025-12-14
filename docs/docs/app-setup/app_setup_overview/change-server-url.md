---
sidebar_position: 11
---

# How to Change Server URL

If you need to update the server URL in your Flutter app, follow these steps to ensure proper connectivity.  

---

## 🔑 Step 1: Get the API Base URL  

  1. Open your **Admin Panel**.  
  2. Navigate to:  

     ```
     Settings -> API Key Settings
     ```

  3. Copy the API link for your app.  

  ![server_baseurl](../../../static/img/app/server_baseurl.webp)

:::note
   Ensure you copy the **correct base URL**.  
:::
---

## 📝 Step 2: Update the URL in Your App  

  1. Navigate to the following file:  

     ```
     lib/helper/constant.dart
     ```

  2. Locate the `baseURL` variable and update it with the new API URL.  

     ```dart
     const String baseURL = "https://your-server.com/api/";
     ```
    ![serverurl](../../../static/img/app/serverurl.webp)
:::note
  **⚠️ Don't forget:** Add a **slash (`/`) after `api`** to avoid errors.  
:::
---

## ⚡ Step 3: Apply Changes  

  1. Save the file.  
  2. Restart the app to apply the new settings.  

---

✅ **Your server URL is now updated!** 🚀🌍 