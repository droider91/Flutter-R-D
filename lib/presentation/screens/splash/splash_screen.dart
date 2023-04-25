import 'dart:async';

import 'package:flutter/material.dart';

import '../db_test/home_screen.dart';
import '../drinks/dashboard.dart';
import '../login/login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/neologo.jpg'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const DashboardScreen())));
  }
}
