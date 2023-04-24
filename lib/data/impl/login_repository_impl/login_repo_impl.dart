import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/error/error.dart';
import 'package:flutter_boilerplate/domain/repository/login/login_repository.dart';
import 'package:flutter_boilerplate/domain/usecase/login/login_usecase.dart';

class LoginRepoImpl implements LoginRepository {
  @override
  Future<Either<Errr, bool>> doLogin(LoginParams loginParams) async {
    if (loginParams.number == '9876543210' ||
        loginParams.number == '1234567890') {
      return const Right(true);
    } else {
      return Left(Errr(msg: 'Mobile number is not valid'));
    }
  }
}
