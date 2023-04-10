import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBXaFp3L2rLvWWSzv3vZMVQBbs2X80LKB4",
            authDomain: "chatapp-1f872.firebaseapp.com",
            projectId: "chatapp-1f872",
            storageBucket: "chatapp-1f872.appspot.com",
            messagingSenderId: "221285397671",
            appId: "1:221285397671:web:d6e56e1300b5a541b6d782",
            measurementId: "G-48NWMM2KY3"));
  } else {
    await Firebase.initializeApp();
  }
}
