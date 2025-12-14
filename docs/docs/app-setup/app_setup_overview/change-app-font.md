---
sidebar_position: 10
---

# How to Change App Font

Customizing the font in your Flutter app enhances the user experience. Follow these steps to change the app font.  

---

## 📂 Step 1: Add Your Font File  

  1. Navigate to the following directory in your project:  

     ```
     assets/fonts/
     ```

  2. Copy and paste your new font files (`.ttf` or `.otf`) into this folder.  

---

## 📝 Step 2: Update `pubspec.yaml`  

  1. Open the `pubspec.yaml` file.  
  2. Locate the **fonts section** and update it as follows:  

     ```yaml
     flutter:
       fonts:
         - family: CustomFont
           fonts:
             - asset: assets/fonts/MyCustomFont.ttf
     ```

  - Replace **`CustomFont`** with your desired font family name.  
  - Replace **`MyCustomFont.ttf`** with the actual font file name.  

---

## 🎨 Step 3: Apply the Font in Your Theme  

  1. Open your **theme configuration file** (e.g., `theme.dart`).  
  2. Set the **new font family** in `TextTheme`:  

     ```dart
     ThemeData(
       fontFamily: 'CustomFont',
     );
     ```

---

## ⚡ Step 4: Apply Changes  

  1. Save the changes.  
  2. Run the following command to apply the changes:  

     ```sh
     flutter pub get
     ```

  3. Restart the app to see the new font in action.  
  
  ![font](../../../static/img/app/font.webp)

✅ **Your app now has a new font!** 🎨🚀 