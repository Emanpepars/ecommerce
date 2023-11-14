import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/login_screen/domain/entities/login_entity.dart';

abstract class LoginDomainRepo {
  Future<Either<Failures, LoginEntity>> login(String email, String password);
}
