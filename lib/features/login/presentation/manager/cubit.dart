import 'package:ecommerce/features/login/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_sources/login_data_sources.dart';
import '../../data/repositories/login_data_repo.dart';
import '../../domain/repositories/login_domain_repo.dart';
import '../../domain/use_cases/login_use_case.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginDataSources sources;

  LoginCubit(this.sources) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login() async {
    emit(LoginLoadingStates());
    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);

    var result = await loginUseCase.call("hesham9000@gmail.com", "123@Hesham");
    result.fold((l) {
      emit(LoginFailureState(l));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }
}
