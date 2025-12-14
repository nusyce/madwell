---
sidebar_position: 11
---

# Microsoft Clarity Setup for App (Customer Side)

Microsoft Clarity is already integrated in the app. You only need to replace your own Microsoft Clarity Project ID in the provided file.

---

## 📝 Step 1: Create Microsoft Clarity Account

1️⃣ Go to: **[https://clarity.microsoft.com](https://clarity.microsoft.com)**

2️⃣ Sign in using your Microsoft, Google, or Facebook account.

3️⃣ Create a new project.

4️⃣ After project creation, copy your **Project ID**.

---

## ⚙️ Step 2: Update Project ID in App Source Code

1️⃣ Open the following file in your Flutter project:

```
/lib/analytics/analytics_ids.dart
```

2️⃣ Find this variable:

```dart
static const String microsoftClarityProjectId = "YOUR_PROJECT_ID";
```

3️⃣ Replace it with your real Clarity Project ID:

```dart
static const String microsoftClarityProjectId = "abc123xyz";
```

4️⃣ Save the file.

---

:::note
Replace `"abc123xyz"` with your actual Microsoft Clarity Project ID obtained from Step 1.
:::

🎉 **Microsoft Clarity is now configured for your app!** 🚀

