import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:securingfunding_flutter/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              );
            }, //headerBuilder
            subtitleBuilder: (context, action) {
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0),
               child: action == AuthAction.signIn
                   ? const Text('Welcome to SecuringFunding, please sign in!')
                   : const Text('Welcome to SecuringFunding, please sign up!'),
             );
           },
          );
        }
      return const MyHomePage(title: 'Home Page; login successful');
      },
    );
  }
}