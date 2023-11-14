import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/sign_up/domain/entities/user_data.dart';

import '../entities/SignUpEntity.dart';

abstract class SignUpDomainRepo {
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData);
}
