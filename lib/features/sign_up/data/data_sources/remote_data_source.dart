import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/end_points.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/utils/app_constants.dart';
import 'package:ecommerce/features/sign_up/data/data_sources/sign_up_data_sources.dart';
import 'package:ecommerce/features/sign_up/data/models/Sign_up_model.dart';
import 'package:ecommerce/features/sign_up/domain/entities/user_data.dart';

class RemoteDataSource implements SignUpDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) async {
    try {
      var response =
          await dio.post("${AppConstants.BASEURL}${EndPoints.signUp}", data: {
        "name": userData.name,
        "email": userData.email,
        "password": userData.password,
        "rePassword": userData.password,
        "phone": userData.phone,
      });
      SignUpModel signUpModel = SignUpModel.fromJson(response.data);
      return Right(signUpModel);
    } catch (e) {
      return Left(ServerFailures(
        e.toString(),
      ));
    }
  }
}
