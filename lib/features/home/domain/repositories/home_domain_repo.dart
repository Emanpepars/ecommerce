import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/entities/category_or_brand_entity.dart';

import '../../../../core/error/failures.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories();
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands();
}
