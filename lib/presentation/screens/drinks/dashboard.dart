import 'package:flutter/material.dart';

import 'details/details.dart';
import 'drink_categories/categories.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final _buildBody = const <Widget>[CategoryListScreen(), DetailsScreen()];
  final _titleBody = const <String>['Select from drinks', 'Select from recipes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Drinks',
            icon: Icon(Icons.local_drink),
          ),
          BottomNavigationBarItem(
            label: 'Recipes',
            icon: Icon(Icons.food_bank),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_titleBody[_currentIndex]),
        centerTitle: true,
      ),
      body: _buildBody[_currentIndex],
    );
  }

  @override
  void initState() {}
}
