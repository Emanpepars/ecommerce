import 'package:bloc/bloc.dart';
import 'package:ecommerce/config/routes/routes.dart';
import 'package:ecommerce/core/utils/app_observer.dart';
import 'package:ecommerce/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  var user = CacheHelper.getData("User");
  String route;
  if(user == null){
    route = Routes.login;
  }else{
    route = Routes.home;
  }
  runApp( MyApp(route));
}
