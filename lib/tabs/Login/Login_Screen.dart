import 'package:flutter/material.dart';
import 'package:islami_app/tabs/Login/Login_Tab.dart';
import 'package:islami_app/tabs/Login/SignUp_Tab.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName="Login screen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Login"),
          bottom: const TabBar(tabs: [
            Tab(
              child: Text("Login"),
            ),
            Tab(
              child: Text("Sign up"),
            )
          ]
          ),
        ),
        body: const TabBarView(children: [
          LoginTab(),
          SignUpTab(),
        ]
        ),
      ),
    );
  }
}
