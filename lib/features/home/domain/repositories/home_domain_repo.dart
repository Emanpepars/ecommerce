import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce/features/home/domain/entities/product_entity.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/cart_response_model.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandEntity>> getBrands();

  Future<Either<Failures, ProductEntity>> getProducts();

  Future<Either<Failures, CartResponse>> addToCart(String productId);

}
