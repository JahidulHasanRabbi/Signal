import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:signal/component/mybutton.dart';
import 'package:signal/component/textfield.dart';
import 'package:signal/page/home.dart';
import 'package:signal/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void singin() async {
    final authservice = Provider.of<AuthService>(context, listen: false);

    try {
      await authservice.signWithEmailandPassword(
          emailcontroller.text, passwordcontroller.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                //icon
                const Icon(
                  Icons.account_circle,
                  size: 120,
                  color: Colors.blue,
                ),

                const SizedBox(height: 25),

                //Text
                const Text("Login to Continue!",
                    style: TextStyle(fontSize: 20)),

                const SizedBox(height: 25),

                //Email Field
                MyTextField(
                    controller: emailcontroller,
                    hintText: 'Email',
                    obscureText: false),

                //Password Field
                const SizedBox(height: 25),

                MyTextField(
                    controller: passwordcontroller,
                    hintText: 'Password',
                    obscureText: true),

                const SizedBox(height: 25),
                //Login Button
                MyButton(onTap: singin, text: 'Log In'),
                //Register Text

                const SizedBox(height: 25),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
