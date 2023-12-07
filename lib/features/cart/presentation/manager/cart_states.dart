import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/cart_response_model.dart';

abstract class CartStates {}

class CartInitState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  CartResponse cartResponse;

  CartSuccessState(this.cartResponse);
}

class CartErrorState extends CartStates {
  Failures failures;

  CartErrorState(this.failures);
}

class CartDeleteItemErrorStates extends CartStates {
  Failures failures;

  CartDeleteItemErrorStates(this.failures);
}
