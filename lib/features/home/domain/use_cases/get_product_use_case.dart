import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_domain_repo.dart';

class GetProductsUseCase {
  HomeDomainRepo homeDomainRepo;

  GetProductsUseCase(this.homeDomainRepo);

  Future<Either<Failures, ProductEntity>> call() =>
      homeDomainRepo.getProducts();
}
