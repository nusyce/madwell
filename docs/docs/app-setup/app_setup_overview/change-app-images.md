---
sidebar_position: 6
---

# How to Change Images in the App

Updating images in your Flutter app is simple. Follow these steps to replace existing images with new ones.  

---

## 📂 Step 1: Locate the Images Folder  

  1. Navigate to the following directory in your project:  

     ```
     assets/images/
     ```

  2. Find the image file you want to replace.  
  
---

## 🔄 Step 2: Replace the Image  

  1. **Use the same filename** as the existing image to avoid updating multiple references.  
  2. Ensure that the **new image has the correct format** (e.g., `.png`, `.jpg`, `.svg`).  
  3. If you add a **new image with a different name**, update the references in your code accordingly. 

---

- ***[Image Change Guide](https://wrteam-in.github.io/common_app_doc/GeneralSettings/assets)*** 

> ⚠️ **Important:**  
Please follow all platform-specific instructions carefully to ensure proper functionality across both Android and iOS.


---

## ⚡ Step 3: Apply Changes  

  1. Run the following command to refresh the assets:  

     ```sh
     flutter pub get
     ```

  2. Restart the app to see the updated images.  


✅ **Your images are now successfully updated!** 🎉 