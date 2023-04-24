import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
            maxLines: 4,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: 'Enter your event',
              border: OutlineInputBorder(),
            ),
            style: const TextStyle(fontSize: 18),
            onChanged: (enteredText) {},
          ),
        ],
      )),
    );
  }
}
