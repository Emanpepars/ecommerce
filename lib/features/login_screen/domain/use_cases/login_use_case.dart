import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/login_screen/domain/entities/login_entity.dart';
import 'package:ecommerce/features/login_screen/domain/repositories/login_domain_repo.dart';

class LoginUseCase {
  LoginDomainRepo loginDomainRepo;

  LoginUseCase(this.loginDomainRepo);

  Future<Either<Failures, LoginEntity>> call(String email, String password) =>
      loginDomainRepo.login(email, password);
}
