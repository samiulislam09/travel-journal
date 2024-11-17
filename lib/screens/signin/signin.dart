import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_journal/screens/home/home.dart';
import 'package:travel_journal/screens/signin/bloc/sign_in_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  TextEditingController emailControoller = TextEditingController();
  TextEditingController passwordControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Sign In',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 300,
                width: double.infinity,
                child: Image.asset('assets/images/Riding.png'),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        if (state is SignInErrorState) {
                          return Text(
                            state.error,
                            style: TextStyle(color: Colors.red),
                          );
                        }
                        return Container();
                      },
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailControoller,
                      onChanged: (val) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInInputChanged(
                                email: emailControoller.text,
                                password: passwordControlller.text));
                      },
                      decoration: const InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordControlller,
                      obscureText: true,
                      onChanged: (val) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInInputChanged(
                                email: emailControoller.text,
                                password: passwordControlller.text));
                      },
                      decoration: const InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                          return BlocBuilder<SignInBloc, SignInState>(
                            builder: (context, state) {
                              if (state is SignInLoadingState) {
                                return Center(
                                    child: const CircularProgressIndicator());
                              }
                              return ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<SignInBloc>(context).add(
                                      SignInButtonPressed(
                                          email: emailControoller.text,
                                          password: passwordControlller.text));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: (state is SignInValidState)
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
