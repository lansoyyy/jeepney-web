import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jeepney_web/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          authDomain: 'jeepney-ed3c6.firebaseapp.com',
          apiKey: "AIzaSyBIqZyHQXTOjDWLsaWV8yaxoADoo_vlTLA",
          appId: "1:290773954732:web:8cfbb1f951b87068dd6f09",
          messagingSenderId: "290773954732",
          projectId: "jeepney-ed3c6",
          storageBucket: "jeepney-ed3c6.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeepney Stop System Web Server',
      home: HomeScreen(),
    );
  }
}
