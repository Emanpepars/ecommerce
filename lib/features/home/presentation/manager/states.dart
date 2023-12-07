import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/domain/entities/product_entity.dart';

import '../../data/models/cart_response_model.dart';
import '../../domain/entities/category_or_brand_entity.dart';

abstract class HomeStates {}

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

class HomeGetProductsSuccessState extends HomeStates {
  ProductEntity productEntity;

  HomeGetProductsSuccessState(this.productEntity);
}

class HomeGetProductsErrorState extends HomeStates {
  Failures failures;

  HomeGetProductsErrorState(this.failures);
}

class HomeAddToCartLoadingState extends HomeStates {}

class HomeAddToCartSuccessState extends HomeStates {
  CartResponse addToCartEntity;

  HomeAddToCartSuccessState(this.addToCartEntity);
}

class HomeAddToCartErrorState extends HomeStates {
  Failures failures;

  HomeAddToCartErrorState(this.failures);
}

class HomeAddToFavState extends HomeStates {}

class ChangeBottomNavBar extends HomeStates {}
