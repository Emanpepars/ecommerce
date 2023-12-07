import 'package:ecommerce/features/cart/data/data_sources/cart_data_source.dart';
import 'package:ecommerce/features/cart/data/repositories/cart_data_repo.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_domain_repo.dart';
import 'package:ecommerce/features/cart/domain/use_cases/cart_use_case.dart';
import 'package:ecommerce/features/cart/domain/use_cases/delet_cart_item_use_case.dart';
import 'package:ecommerce/features/cart/domain/use_cases/update_count_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartDataSource cartDataSource;

  CartCubit(this.cartDataSource) : super(CartInitState());

  static CartCubit get(context) => BlocProvider.of(context);

  void getCart() async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDataSource);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.call();
    result.fold(
      (l) {
        print(l.message);
        emit(CartErrorState(l));
      },
      (r) {
        emit(CartSuccessState(r));
      },
    );
  }

  void update(String productId, int count) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDataSource);
    UpdateCartUseCase updateCartUseCase = UpdateCartUseCase(cartDomainRepo);
    var result = await updateCartUseCase.call(productId, count);
    result.fold(
      (l) {
        print(l.message);
        emit(CartDeleteItemErrorStates(l));
      },
      (r) {
        emit(CartSuccessState(r));
      },
    );
  }

  void deleteItem(String id) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDataSource);
    DeleteCartUseCase deleteCartUseCase = DeleteCartUseCase(cartDomainRepo);
    var result = await deleteCartUseCase.call(id);
    result.fold(
      (l) {
        print(l.message);
        emit(CartDeleteItemErrorStates(l));
      },
      (r) {
        emit(CartSuccessState(r));
      },
    );
  }
}
