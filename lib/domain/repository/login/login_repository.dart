import 'package:dartz/dartz.dart';

import '../../../core/error/error.dart';
import '../../usecase/login/login_usecase.dart';

abstract class LoginRepository {
  Future<Either<Errr, bool>> doLogin(LoginParams loginParams);
}
