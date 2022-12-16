import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_shops/screens/home_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              'Signup',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          const SizedBox(height: 40.0),
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width / 1.2,
          //     child: Material(
          //       elevation: 8,
          //       shadowColor: Colors.black87,
          //       borderRadius: BorderRadius.circular(30.0),
          //       child: TextField(
          //         controller: _nameController,
          //         textAlignVertical: TextAlignVertical.bottom,
          //         decoration: InputDecoration(
          //           border: OutlineInputBorder(
          //             borderSide: BorderSide.none,
          //             borderRadius: BorderRadius.circular(30.0),
          //           ),
          //           filled: true,
          //           fillColor: Color.fromARGB(255, 210, 210, 210),
          //           hintText: 'Name',
          //           prefixIcon: Icon(Icons.person),
          //         ),
          //         cursorColor: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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
                    fillColor: Color.fromARGB(255, 210, 210, 210),
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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
                    fillColor: Color.fromARGB(255, 210, 210, 210),
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }).onError((error, stackTrace) {
                    // ignore: avoid_print
                    print('Error ${error.toString()}');
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
