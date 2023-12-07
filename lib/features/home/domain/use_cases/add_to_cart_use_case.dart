import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/domain/repositories/home_domain_repo.dart';

import '../../data/models/cart_response_model.dart';

class AddToCartUseCase {
  HomeDomainRepo homeDomainRepo;

  AddToCartUseCase(this.homeDomainRepo);

  Future<Either<Failures, CartResponse>> call(String productId) =>
      homeDomainRepo.addToCart(productId);
}
