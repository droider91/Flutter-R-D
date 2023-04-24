import 'package:dartz/dartz.dart';

import '../../../core/basecase/base_usecase.dart';
import '../../../core/error/error.dart';
import '../../repository/login/login_repository.dart';

class LoginUseCase implements BaseUseCase<bool, LoginParams> {
  late LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  @override
  Future<Either<Errr, bool>> call(LoginParams params) async {
    print('LoginUseCase: $params');
    if (params.isValid()) {
      return await loginRepository.doLogin(params);
    } else {
      return Left(Errr(msg: 'Mobile number is not valid'));
    }
  }
}

class LoginParams {
  String number;

  LoginParams({required this.number});

  bool isValid() {
    if (number != 10) {
      return false;
    } else {
      return true;
    }
  }
}
