---
sidebar_position: 5
---

# How to Change Package Name in Flutter

Changing your app’s package name (also known as application ID or bundle identifier) is essential for publishing a unique version of your app on the Play Store or App Store.
 
---

### 📘 Guide to Change Package Name  
**[View Package Name Change Guide](https://wrteam-in.github.io/common_app_doc/GeneralSettings/packagename)**

---

### 🔧 What’s Included:
- Steps to rename the Android package and iOS bundle identifier
- Folder structure adjustments
- Configuration and build file updates

### ▶️ Rerun These Commands After Renaming:

```bash
flutter clean
flutter pub get
```

---

> ⚠️ **Important:**  
Update the directory structure and configuration files correctly for both Android and iOS to avoid build errors.


### ❓ Common Questions  

#### 🔹 **Q1: What if my package name is `eDemand.wrteam.multivendor.customer`?**  

✅ **Answer:**  
-   You need to create **4 folders** inside the `kotlin` directory as per your package name:  

    ```
    eDemand/wrteam/multivendor/customer/
    ``` 