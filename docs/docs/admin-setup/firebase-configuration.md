---
sidebar_position: 3
---

# Firebase Configuration

## Create Firebase Project

1. Goto >> Firebase console 
2. Register a new account or try to log in with existing google accout.

 ![env-file](../../static/img/adminPanel/fb-1.webp)

 3. Once logged in, you can see firebase console dashboard. Click on Add Project.Provide a project name, and then select country and then after that click on Create Project. For example, see the below image.

 ![env-file](../../static/img/adminPanel/fb-2.webp)
 ![env-file](../../static/img/adminPanel/fb-3.webp)

4. Once the project has been created, it will automatically redirect to Firebase dashboard screen.

 ![env-file](../../static/img/adminPanel/fb-4.webp)

5. Now you need to add web project/application to the firebase project.

 ![env-file](../../static/img/adminPanel/fb-5.webp)

6. Goto Authentication and open " Sign-in method " Tab
 ![env-file](../../static/img/adminPanel/fb-6.webp)

7. Now go to Authentication , -> In Authentication go to settings -> In "Authorized domains", localhost and a Firebase domain are automatically added. -> Here we've to add domain name without http:// and https://

 ![env-file](../../static/img/adminPanel/fb-7.webp)


 8.Goto Project settings in firebase dashboard option.


 ![env-file](../../static/img/adminPanel/fb-8.webp)


8. Goto Project settings and scroll down you will find created web App there you find config option that will have firebase settings for front end.


9. here you have to set all details
 ![env-file](../../static/img/adminPanel/fb-12.webp)

10. You need to set this details in eDemand admin panel -> Firebase Settings Page from Settings page

![env-file](../../static/img/adminPanel/firebase_setting.webp)

## Where to find Vapid key

1. Open the Cloud Messaging tab of the Firebase console Settings pane and scroll to the Web configuration section.
2. In the Web Push certificates tab, click Generate Key Pair. The console displays a notice that the key pair was generated, and displays the public key string and date added

Or look at steps by steps images below

1. Open Project settings

![env-file](../../static/img/adminPanel/vapidKey1.png)

2. Choose Cloud Messaging, scroll down to Web configuration. In Web Push certificates you can find Vapid key ( If it doesn't exists, click Generate Key Pair to create )

![env-file](../../static/img/adminPanel/VapidKey2.png)
![env-file](../../static/img/adminPanel/vapidKey3.png)


11.  You need to set this details in firebase-messaging-sw.js file


:::note

If firebase-messaging-sw.js not exist inside your root folder then create a file with firebase-messaging-sw.js name inside your project folder.

:::

```javascript
// Replace the following with your app's Firebase project configuration
firebase.initializeApp
({
apiKey: "Your apiKey",
authDomain: "Your authDomain",
projectId: "Your projectId",
storageBucket: "Your storageBucket",
messagingSenderId: "Your messagingSenderId",
appId: "Your appId",
measurementId: "Your measurementId"
});
```

View firebase-messaging-sw.js and put content in file as below
```javascript
importScripts('https://www.gstatic.com/firebasejs/8.2.0/firebase.js');
importScripts('https://www.gstatic.com/firebasejs/8.2.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.2.0/firebase-messaging.js');




// Initialize Firebase
var config = {
  apiKey:"Your apiKey" ,
  authDomain:"Your authDomain" ,
  projectId:"Your projectId" ,
  storageBucket:"Your storageBucket" ,
  messagingSenderId:"Your messagingSenderId" ,
  appId:"Your appId",
  measurementId:"Your measurementId" 
};


firebase.initializeApp(config);
const fcm=firebase.messaging();
fcm.getToken({
    vapidKey:"your vapidey"
}).then((token)=>{
    // console.log('getToken');
});



fcm.onBackgroundMessage((data)=>{
    // console.log('onBackgroundMessage - ',data);
})

```

:::note
Upload json file In firebase configuration
:::

![env-file](../../static/img/adminPanel/generate-key.png)
![env-file](../../static/img/adminPanel/Firebase-Settings-Admin-Panel-—-eDemand-On-Demand-Services.png)








