import 'package:ecommerce/core/error/failures.dart';

import '../../domain/entities/category_or_brand_entity.dart';

class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeGetCategoriesSuccessState extends HomeStates {
  CategoryOrBrandEntity categoryOrBrandEntity;

  HomeGetCategoriesSuccessState(this.categoryOrBrandEntity);
}

class HomeGetCategoriesErrorState extends HomeStates {
  Failures failures;

  HomeGetCategoriesErrorState(this.failures);
}

class HomeGetBrandsSuccessState extends HomeStates {
  CategoryOrBrandEntity categoryOrBrandEntity;

  HomeGetBrandsSuccessState(this.categoryOrBrandEntity);
}

class HomeGetBrandsErrorState extends HomeStates {
  Failures failures;

  HomeGetBrandsErrorState(this.failures);
}

class ChangeBottomNavBar extends HomeStates {}
