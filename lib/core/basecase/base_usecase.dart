import 'package:dartz/dartz.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Error, Type>> call(Params param);
}
