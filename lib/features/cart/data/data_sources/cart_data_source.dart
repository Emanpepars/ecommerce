import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/end_points.dart';
import 'package:ecommerce/core/utils/app_constants.dart';
import 'package:ecommerce/core/utils/cache_helper.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/models/cart_response_model.dart';

abstract class CartDataSource {
  Future<Either<Failures, CartResponse>> getCart();

  Future<Either<Failures, CartResponse>> update(String productId, int count);

  Future<Either<Failures, CartResponse>> deleteItemOfCart(
    String productId,
  );
}

class CartRemoteDto implements CartDataSource {
  Dio dio = Dio();
  var token = CacheHelper.getData("User");

  @override
  Future<Either<Failures, CartResponse>> getCart() async {
    try {
      var response = await dio.get(
          "${AppConstants.BASEURL}${EndPoints.addToCart}",
          options: Options(headers: {"token": token}));
      print(response.data);
      print(response.statusCode);
      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id) async {
    try {
      var response = await dio.delete(
          "${AppConstants.BASEURL}${EndPoints.addToCart}/$id",
          options: Options(headers: {"token": token}));

      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> update(String id, int count) async {
    try {
      var response = await dio.put(
          "${AppConstants.BASEURL}${EndPoints.addToCart}/$id",
          options: Options(headers: {"token": token}),
          data: {"count": count});

      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class CartLocalDto implements CartDataSource {
  @override
  Future<Either<Failures, CartResponse>> getCart() {
    // TODO: implement getCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> update(String productId, int count) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItemOfCart(String productId) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }
}
