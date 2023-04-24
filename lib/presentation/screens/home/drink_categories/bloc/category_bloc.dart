import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/domain/usecase/category/category_usecase.dart';
import '../../../../../data/impl/drink_category_repository_impl/category_repo_impl.dart';
import '../../../../../data/model/category/category_list.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitialState()) {
    on<CategoryLoadingEvent>(categoryLoadingState);
    on<CategoryListedEvent>(categoryListedEvent);
  }

  FutureOr<void> categoryLoadingState(
      CategoryLoadingEvent event, Emitter<CategoryState> emit) async {
    print("categoryLoadingState");
    emit(CategoryLoadingState());
    Future.delayed(Duration(seconds: 2));
    print("categoryLoadingState: Delayed");
    var list = await CategoryUseCase(CategoryRepoImpl())
        .call(CategoryParams(categoryName: ""));
    list.fold((e) {
      print("categoryLoadingState: emitting: $e");
      emit(CategoryErrorState(err: e.msg));
    }, (s) {
      print("categoryLoadingState: emitting: ${s.drinks}");
      emit(CategoryListingState(list: s.drinks));
    });
  }

  FutureOr<void> categoryListedEvent(
      CategoryListedEvent event, Emitter<CategoryState> emit) async {
    var list = await CategoryUseCase(CategoryRepoImpl())
        .call(CategoryParams(categoryName: ""));
    list.fold((e) => emit(CategoryErrorState(err: e.msg)),
        (s) => emit(CategoryListingState(list: s.drinks)));
  }
}
