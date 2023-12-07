import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_domain_repo.dart';

class GetCategoriesUseCase {
  HomeDomainRepo homeDomainRepo;

  GetCategoriesUseCase(this.homeDomainRepo);

  Future<Either<Failures, CategoryOrBrandEntity>> call() =>
      homeDomainRepo.getCategories();
}
