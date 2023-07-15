import 'package:flutter/material.dart';
import 'dart:core';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (String? value) {
                  if (value == "") {
                    return "Name field cannot be empty";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: _phoneKey,
                controller: phoneController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Phone Number';
                  } else if (!RegExp(r'^03\d{11}$').hasMatch(value)) {
                    return 'Please Enter A Valid Number';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                    _phoneKey.currentState!.validate();
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
