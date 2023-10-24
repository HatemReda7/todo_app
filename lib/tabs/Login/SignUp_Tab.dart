import 'package:flutter/material.dart';
import 'package:islami_app/Shared/firebase/FireBase_Functions.dart';
import 'package:islami_app/tabs/Login/Login_Screen.dart';
import 'package:islami_app/tabs/Login/Login_Tab.dart';

class SignUpTab extends StatefulWidget {
  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var ageController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Name';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Age';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  FirebaseFunctions.createUser(
                      emailController.text, passwordController.text,nameController.text,int.parse(ageController.text), () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.routeName, (route) => false);
                  }, (message) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text(message),
                        actions: [
                          ElevatedButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text("Okay!"))
                        ],
                      ),
                    );
                  });
                }
              },
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
