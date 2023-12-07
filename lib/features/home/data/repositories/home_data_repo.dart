import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/data_sources/home_data_sources.dart';
import 'package:ecommerce/features/home/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_domain_repo.dart';

import '../models/cart_response_model.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo(this.homeDataSources);

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories() {
    return homeDataSources.getCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands() {
    return homeDataSources.getBrands();
  }

  @override
  Future<Either<Failures, ProductEntity>> getProducts() {
    return homeDataSources.getProducts();
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(productId) {
    return homeDataSources.addToCart(productId);
  }

}
