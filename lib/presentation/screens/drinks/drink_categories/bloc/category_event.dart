part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryLoadingEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategoryListedEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategoryClickEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}
