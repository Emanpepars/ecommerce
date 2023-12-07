import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/models/cart_response_model.dart';

abstract class CartDomainRepo {
  Future<Either<Failures, CartResponse>> getCart();

  Future<Either<Failures, CartResponse>> update(String productId, int count);

  Future<Either<Failures, CartResponse>> deleteItem(String productId);
}
