import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBz0dFf94hF-5jU-PhK5cdf39ufIZLQNGY",
            authDomain: "fluttercarpool-8fa66.firebaseapp.com",
            projectId: "fluttercarpool-8fa66",
            storageBucket: "fluttercarpool-8fa66.appspot.com",
            messagingSenderId: "831932788025",
            appId: "1:831932788025:web:c664ea40d6bed011728ce8",
            measurementId: "G-3KMQKWVQXK"));
  } else {
    await Firebase.initializeApp();
  }
}
