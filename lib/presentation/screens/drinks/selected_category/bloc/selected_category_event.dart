part of 'selected_category_bloc.dart';

@immutable
abstract class SelectedCategoryEvent extends Equatable {}

class SelectedCategoryLoadingEvent extends SelectedCategoryEvent {
  final String selectedCategory;

  SelectedCategoryLoadingEvent({required this.selectedCategory});

  @override
  List<Object?> get props => [];
}

class SelectedCategoryListEvent extends SelectedCategoryEvent {
  @override
  List<Object?> get props => [];
}

class SelectedCategoryClickEvent extends SelectedCategoryEvent {
  @override
  List<Object?> get props => [];
}

class SearchInDrinksEvent extends SelectedCategoryEvent {
  final String searchTerm;

  SearchInDrinksEvent({required this.searchTerm});

  @override
  List<Object?> get props => [];
}
