import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/data/impl/selected_category_impl/selected_category_repo_impl.dart';
import 'package:flutter_boilerplate/domain/usecase/selected_category/selected_category_usecase.dart';
import 'package:meta/meta.dart';

import '../../../../../data/model/selected_category_data/drinks.dart';

part 'selected_category_event.dart';

part 'selected_category_state.dart';

class SelectedCategoryBloc
    extends Bloc<SelectedCategoryEvent, SelectedCategoryState> {
  SelectedCategoryBloc() : super(SelectedCategoryInitial()) {
    on<SelectedCategoryLoadingEvent>(selectedCategoryLoadingEvent);
    on<SelectedCategoryListEvent>(selectedCategoryListEvent);
  }

  FutureOr<void> selectedCategoryLoadingEvent(
      SelectedCategoryLoadingEvent event,
      Emitter<SelectedCategoryState> emit) async {
    emit(SelectedCategoryLoadingState());
    Future.delayed(const Duration(seconds: 1));
    var selectedCategoryResponse =
        await SelectedCategoryUseCase(SelectedCategoryRepositoryImpl())
            .call(SelectedCategoryParams(categoryName: event.selectedCategory));
    selectedCategoryResponse.fold((err) {
      emit(SelectedCategoryErrorState(errMsg: err.msg));
    }, (success) {
      emit(SelectedCategoryListingState(selectedDrinkList: success.drinks));
    });
  }

  FutureOr<void> selectedCategoryListEvent(
      SelectedCategoryListEvent event, Emitter<SelectedCategoryState> emit) {}
}
