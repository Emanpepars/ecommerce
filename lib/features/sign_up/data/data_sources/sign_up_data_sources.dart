import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/sign_up/data/models/Sign_up_model.dart';
import 'package:ecommerce/features/sign_up/domain/entities/user_data.dart';

abstract class SignUpDataSources {
  Future<Either<Failures, SignUpModel>> signUp(UserData userData);
}
