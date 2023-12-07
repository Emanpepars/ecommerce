import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_domain_repo.dart';
import 'package:ecommerce/features/home/data/models/cart_response_model.dart';

class CartUseCase {
  CartDomainRepo cartDomainRepo;

  CartUseCase(this.cartDomainRepo);

  Future<Either<Failures, CartResponse>> call() => cartDomainRepo.getCart();
}
