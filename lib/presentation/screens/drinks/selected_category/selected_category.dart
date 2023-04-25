import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/presentation/screens/drinks/selected_category/bloc/selected_category_bloc.dart';
import 'dart:math' as math;
import 'package:getwidget/getwidget.dart';

import '../dashboard.dart';

class SelectedCategoryScreen extends StatefulWidget {
  const SelectedCategoryScreen({super.key, required this.selectedCategory});

  final String selectedCategory;

  @override
  State<SelectedCategoryScreen> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategoryScreen> {
  final SelectedCategoryBloc selectedCategoryBloc = SelectedCategoryBloc();

  @override
  void initState() {
    selectedCategoryBloc.add(SelectedCategoryLoadingEvent(
        selectedCategory: widget.selectedCategory));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectedCategoryBloc, SelectedCategoryState>(
      listener: (context, state) {
        print("listening state is: $state");
      },
      bloc: selectedCategoryBloc,
      listenWhen: (previous, current) => current is SelectedCategoryState,
      buildWhen: (previous, current) => current is SelectedCategoryState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case SelectedCategoryLoadingState:
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 20.0,
                  onPressed: () {},
                ),
                title: const Text('Loading...'),
                centerTitle: true,
                backgroundColor:
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case SelectedCategoryListingState:
            state as SelectedCategoryListingState;
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()));
                  },
                ),
                title: Text(widget.selectedCategory),
                centerTitle: true,
                backgroundColor:
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
              ),
              body: GridView.count(
                crossAxisCount: 3,
                children: [
                  ...state.selectedDrinkList.map((i) => Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(child: Image.network(i.strDrinkThumb)),
                          ),
                          Center(
                            widthFactor: double.maxFinite,
                            child: Text(i.strDrink,
                                maxLines: 2,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                          )
                        ],
                      )),
                ],
              ),
            );
            break;
          case SelectedCategoryErrorState:
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()));
                  },
                ),
                title: const Text('Error in loading...'),
                centerTitle: true,
                backgroundColor:
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
              ),
              body: Text('error in loading...'),
            );
            break;
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget card(
    String title,
    BuildContext context,
  ) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      child: Column(
        children: [
          InkWell(
            hoverColor: Colors.lightBlueAccent,
            focusColor: Colors.red,
            onTap: () {
              print(title);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SelectedCategoryScreen(selectedCategory: title)));
            },
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
