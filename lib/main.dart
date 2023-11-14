import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/utils/app_observer.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
