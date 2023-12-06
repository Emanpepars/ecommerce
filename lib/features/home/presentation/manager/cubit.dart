import 'package:ecommerce/features/home/data/data_sources/home_data_sources.dart';
import 'package:ecommerce/features/home/data/repositories/home_data_repo.dart';
import 'package:ecommerce/features/home/domain/repositories/home_domain_repo.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_brands_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:ecommerce/features/home/presentation/manager/states.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/categories_tab.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/fav_tab.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/tabs/profile_tab.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSources) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;
  List<Widget> tabs = const [
    HomeTab(),
    CategoriesTab(),
    FavTab(),
    ProfileTab(),
  ];

  changeNavIndex(value) {
    emit(HomeInitState());
    bottomNavIndex = value;
    emit(ChangeBottomNavBar());
  }

  getBrands() async {
    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeDomainRepo);
    var response = await getBrandsUseCase.call();
    response.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  getCategories() async {
    GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesUseCase(homeDomainRepo);
    var response = await getCategoriesUseCase.call();
    response.fold((l) {
      emit(HomeGetCategoriesErrorState(l));
    }, (r) {
      emit(HomeGetCategoriesSuccessState(r));
    });
  }
}
