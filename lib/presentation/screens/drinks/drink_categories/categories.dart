import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../selected_category/selected_category.dart';
import 'bloc/category_bloc.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryListScreen> {
  final CategoryBloc categoryBloc = CategoryBloc();

  @override
  void initState() {
    categoryBloc.add(CategoryLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      bloc: categoryBloc,
      listenWhen: (previous, current) => current is CategoryState,
      buildWhen: (previous, current) => current is CategoryState,
      listener: (context, state) {
        print("listening state: $state");
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CategoryLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case CategoryListingState:
            state as CategoryListingState;
            return Scaffold(
              body: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectedCategoryScreen(
                                  selectedCategory:
                                      state.list[index].strCategory)));
                    },
                    leading: const Icon(Icons.fastfood),
                    title: Text(state.list[index].strCategory),
                    trailing: const Icon(Icons.arrow_right),
                    hoverColor: Colors.black12,
                    selectedColor: Colors.indigoAccent,
                    focusColor: Colors.deepOrangeAccent,
                  );
                },
                itemCount: state.list.length,
              ),
            );
            break;
          default:
            return const SizedBox();
            break;
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
