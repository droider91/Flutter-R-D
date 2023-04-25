part of 'selected_category_bloc.dart';

@immutable
abstract class SelectedCategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectedCategoryInitial extends SelectedCategoryState {}

class SelectedCategoryLoadingState extends SelectedCategoryState {}

class SelectedCategoryErrorState extends SelectedCategoryState {
  final String errMsg;

  SelectedCategoryErrorState({required this.errMsg});
}

class SelectedCategoryListingState extends SelectedCategoryState {
  final List<SelectedDrinks> selectedDrinkList;

  SelectedCategoryListingState({required this.selectedDrinkList});

  @override
  List<Object?> get props => [selectedDrinkList];
}
