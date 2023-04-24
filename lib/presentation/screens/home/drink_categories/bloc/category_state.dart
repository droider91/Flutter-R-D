part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitialState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryErrorState extends CategoryState {
  final String err;

  CategoryErrorState({required this.err});
}

class CategoryListingState extends CategoryState {
  final List<Drinks> list;

  CategoryListingState({required this.list});

  @override
  List<Object?> get props => [list];
}
