import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/login_screen/data/data_sources/login_data_sources.dart';
import 'package:ecommerce/features/login_screen/domain/entities/login_entity.dart';
import 'package:ecommerce/features/login_screen/domain/repositories/login_domain_repo.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSources dto;

  LoginDataRepo(this.dto);

  @override
  Future<Either<Failures, LoginEntity>> login(String email, String password) =>
      dto.login(email, password);
}
