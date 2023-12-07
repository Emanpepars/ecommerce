import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/end_points.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/utils/app_constants.dart';
import 'package:ecommerce/features/home/data/models/category_or_brands_model.dart';
import 'package:ecommerce/features/home/data/models/product_model.dart';

abstract class HomeDataSources {
  Future<Either<Failures, CategoryOrBrandsModel>> getCategories();

  Future<Either<Failures, CategoryOrBrandsModel>> getBrands();

  Future<Either<Failures, ProductModel>> getProducts();
}

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();
  @override
  Future<Either<Failures, CategoryOrBrandsModel>> getCategories() async{
    try {
      var response =
          await dio.get("${AppConstants.BASEURL}${EndPoints.getAllCategories}");
      CategoryOrBrandsModel model =
      CategoryOrBrandsModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandsModel>> getBrands()async {
    try {
      var response =
         await dio.get("${AppConstants.BASEURL}${EndPoints.getAllBrands}");
      CategoryOrBrandsModel model =
          CategoryOrBrandsModel.fromJson(response.data);
     return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() async{
    try {
      var response =
          await dio.get("${AppConstants.BASEURL}${EndPoints.getAllProducts}");
      ProductModel model =
      ProductModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class HomeLocalDto implements HomeDataSources {
  @override
  Future<Either<Failures, CategoryOrBrandsModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryOrBrandsModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
