import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_shops/screens/home_screen.dart';
import 'package:our_shops/screens/signup_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 100),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        const SizedBox(height: 40.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Material(
              elevation: 8,
              shadowColor: Colors.black87,
              borderRadius: BorderRadius.circular(30.0),
              child: TextField(
                controller: _emailController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 210, 210, 210),
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                ),
                cursorColor: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Material(
              elevation: 8,
              shadowColor: Colors.black87,
              borderRadius: BorderRadius.circular(30.0),
              child: TextField(
                controller: _passwordController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 210, 210, 210),
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                ),
                cursorColor: Colors.black,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                )
                    .then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Flexible(
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'OR',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
