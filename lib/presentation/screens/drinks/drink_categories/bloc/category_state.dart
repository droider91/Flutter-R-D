part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryErrorState extends CategoryState {
  final String err;

  CategoryErrorState({required this.err});
}

class CategoryClickedState extends CategoryState {}

class CategoryListingState extends CategoryState {
  final List<Drinks> list;

  CategoryListingState({required this.list});

  @override
  List<Object?> get props => [list];
}
