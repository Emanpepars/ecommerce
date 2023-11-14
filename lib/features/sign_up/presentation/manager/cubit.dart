import 'package:ecommerce/features/sign_up/data/repositories/sign_up_data_repo.dart';
import 'package:ecommerce/features/sign_up/domain/entities/user_data.dart';
import 'package:ecommerce/features/sign_up/domain/repositories/sign_up_domain_repo.dart';
import 'package:ecommerce/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:ecommerce/features/sign_up/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/sign_up_data_sources.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpDataSources sources;

  //عشان اشوف الكونيشكن
  SignUpCubit(this.sources) : super(SignUpInitState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void signUp() async {
    emit(SignUpLoadingStates());
    SignUpDomainRepo signUpDomainRepo = SignUpDataRepo(sources);
    SignUpUseCase signUpUseCase = SignUpUseCase(signUpDomainRepo);
    UserData userData = UserData(
      name: "mohamed hesham",
      phone: "01110255554",
      password: "123@Hesham",
      email: "hesham9000@gmail.com",
    );

    var result = await signUpUseCase.call(userData);
    result.fold((l) {
      emit(SignUpFailureState(l));
    }, (r) {
      emit(SignUpSuccessState(r));
    });
  }
}
