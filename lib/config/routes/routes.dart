import 'package:ecommerce/core/utils/app_components.dart';
import 'package:ecommerce/features/home/presentation/pages/home.dart';
import 'package:ecommerce/features/login_screen/data/data_sources/login_data_sources.dart';
import 'package:ecommerce/features/login_screen/domain/entities/login_entity.dart';
import 'package:ecommerce/features/login_screen/presentation/manager/cubit.dart';
import 'package:ecommerce/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login_screen/presentation/pages/login_screen.dart';

class Routes {
  static const String login = "/";
  static const String signUp = "signUp";
  static const String home = "home";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (BuildContext context) => LoginCubit(RemoteDtoSource()),
              child: const LoginScreen()),
        );
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.home:
        LoginEntity loginEntity = routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(builder: (context) =>  HomeScreen(loginEntity));
      default:
        return MaterialPageRoute(
            builder: (context) => AppComponents.unDefineRoute());
    }
  }
}
