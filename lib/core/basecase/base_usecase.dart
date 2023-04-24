import 'package:dartz/dartz.dart';

import '../error/error.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Errr, Type>> call(Params param);
}
