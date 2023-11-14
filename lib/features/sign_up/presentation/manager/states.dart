import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/sign_up/domain/entities/SignUpEntity.dart';

abstract class SignUpStates {}

class SignUpInitState extends SignUpStates {}

class SignUpLoadingStates extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  SignUpEntity signUpEntity;

  SignUpSuccessState(this.signUpEntity);
}

class SignUpFailureState extends SignUpStates {
  Failures failures;

  SignUpFailureState(this.failures);
}
