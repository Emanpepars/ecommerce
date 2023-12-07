import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_domain_repo.dart';

import '../../../home/data/models/cart_response_model.dart';

class DeleteCartUseCase {
  CartDomainRepo cartDomainRepo;

  DeleteCartUseCase(this.cartDomainRepo);

  Future<Either<Failures, CartResponse>> call(String productId) =>
      cartDomainRepo.deleteItem(productId);
}
