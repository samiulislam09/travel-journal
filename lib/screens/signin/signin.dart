import 'package:flutter/material.dart';
import 'package:travel_journal/screens/home/home.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: const Text('Sign In'),
          ),
        ],
      )),
    );
  }
}
