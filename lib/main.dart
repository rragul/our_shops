import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_shops/firebase_options.dart';
import 'package:our_shops/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Our Shops',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const LoginPage(),
    );
  }
}
