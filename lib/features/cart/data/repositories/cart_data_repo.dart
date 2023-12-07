import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_domain_repo.dart';
import 'package:ecommerce/features/home/data/models/cart_response_model.dart';

import '../data_sources/cart_data_source.dart';

class CartDataRepo implements CartDomainRepo {
  CartDataSource cartDataSource;

  CartDataRepo(this.cartDataSource);

  @override
  Future<Either<Failures, CartResponse>> getCart() => cartDataSource.getCart();

  @override
  Future<Either<Failures, CartResponse>> update(String productId, int count) =>
      cartDataSource.update(productId, count);

  @override
  Future<Either<Failures, CartResponse>> deleteItem(String productId) =>
      cartDataSource.deleteItemOfCart(productId);
}
