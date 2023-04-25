import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/impl/drink_category_repository_impl/entity/drinks/drink_model.dart';
import 'package:flutter_boilerplate/presentation/screens/db_test/home_screen.dart';
import 'package:flutter_boilerplate/presentation/screens/drinks/dashboard.dart';
import 'package:flutter_boilerplate/presentation/screens/login/login.dart';

import 'data/model/notes/note_model.dart';
import 'presentation/screens/splash/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:path_provider/path_provider.dart' as pathProvider;

Future<void> main() async {
  if (kIsWeb) {
    // running on the web!
    print('running on web');
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory.absolute.path);
    Hive.registerAdapter(NoteModelAdapter());
    Hive.registerAdapter(DrinkEntityAdapter());
  }

  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/splash': (context) => SplashScreen(),
      '/db_test': (context) => HomeScreen(),
      '/home': (context) => DashboardScreen(),
      '/login': (context) => Login()
    },
    home: SplashScreen(),
  ));
}
