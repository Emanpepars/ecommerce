import 'package:ecommerce/core/error/failures.dart';

import '../../domain/entities/login_entity.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginEntity loginEntity;

  LoginSuccessState(this.loginEntity);
}

class LoginFailureState extends LoginStates {
  Failures failures;

  LoginFailureState(this.failures);
}
