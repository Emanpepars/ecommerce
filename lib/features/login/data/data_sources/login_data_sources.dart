import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/end_points.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/utils/app_constants.dart';

import '../models/login_model.dart';

abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(String email, String password);
}

class RemoteDtoSource extends LoginDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, LoginModel>> login(
      String email, String password) async {
    try {
      var response =
          await dio.post("${AppConstants.BASEURL}${EndPoints.login}", data: {
        "email": email,
        "password": password,
      });
      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class LocalDtoSource extends LoginDataSources {
  @override
  Future<Either<Failures, LoginModel>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
