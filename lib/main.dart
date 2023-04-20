import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/screens/home/home_screen.dart';

import 'presentation/screens/splash/splash_screen.dart';
import 'package:hive/hive.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/splash': (context) => SplashScreen(),
      '/home': (context) => HomeScreen()
    },
    home: SplashScreen(),
  ));
}
