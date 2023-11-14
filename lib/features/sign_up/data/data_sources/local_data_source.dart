import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/sign_up/data/data_sources/sign_up_data_sources.dart';
import 'package:ecommerce/features/sign_up/data/models/Sign_up_model.dart';
import 'package:ecommerce/features/sign_up/domain/entities/user_data.dart';

class LocalDataSource implements SignUpDataSources {
  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
