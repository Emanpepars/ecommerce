import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/sign_up/domain/entities/SignUpEntity.dart';
import 'package:ecommerce/features/sign_up/domain/entities/user_data.dart';
import 'package:ecommerce/features/sign_up/domain/repositories/sign_up_domain_repo.dart';

import '../data_sources/sign_up_data_sources.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSources sources;

  SignUpDataRepo(this.sources);

  @override
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData) =>
      sources.signUp(userData);
}
