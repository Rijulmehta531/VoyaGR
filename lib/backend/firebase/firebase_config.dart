import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyARre3pAzMkPZKlBCurHyTZLHy6BTwq2kg",
            authDomain: "voyagr-f80bb.firebaseapp.com",
            projectId: "voyagr-f80bb",
            storageBucket: "voyagr-f80bb.appspot.com",
            messagingSenderId: "317517049086",
            appId: "1:317517049086:web:5ced7a8a286ae8190649af"));
  } else {
    await Firebase.initializeApp();
  }
}
