---
sidebar_position: 4
---

# How to Change App Color

Customizing your app's colors enhances branding and improves the user experience. Follow these steps to update your app's theme colors in Flutter.  

---

## 🌈 Updating App Colors in Flutter  

  1. Navigate to the following directory in your Flutter project:  

     ```
     lib > utils > colors.dart
     ```

  2. Open the **`colors.dart`** file.  
  3. Add or modify your color codes using **hexadecimal values**.  
  4. In Flutter, colors follow this format:  

     ```dart
     Color myPrimaryColor = Color(0xff123456); // Replace with your hex code
     ```

     -   `0xff` → **Mandatory prefix** for hexadecimal color codes.  
     -   `123456` → Replace with your desired **hex color code**.  

  5. Update colors for **primary, secondary, accent, and subheading** elements.  
  6. Apply changes to both **light and dark themes** for a consistent UI.  

    ![appcolor](../../../static/img/app/appcolor.webp)


✅ **Your app's colors are now updated!** 🎉 