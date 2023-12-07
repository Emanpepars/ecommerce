import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/features/home/data/data_sources/home_data_sources.dart';
import 'package:ecommerce/features/home/data/repositories/home_data_repo.dart';
import 'package:ecommerce/features/home/domain/entities/brands_entity.dart';
import 'package:ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_domain_repo.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_brands_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_product_use_case.dart';
import 'package:ecommerce/features/home/presentation/manager/states.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/categories_tab.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/fav_tab.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/category_or_brand_entity.dart';
import '../pages/tabs/profile_tab.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSources) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;
  int numOfItemsInCart = 0;
  List<Widget> tabs = const [
    HomeTab(),
    CategoriesTab(),
    FavTab(),
    ProfileTab()
  ];

  List<DataEntity> categories = [];
  List<ProductDataEntity> products = [];

  List<BrandEntity> brands = [
    BrandEntity(
        name: 'Apple',
        image:
            'https://www.tailorbrands.com/wp-content/uploads/2021/01/apple_logo_1988.jpg'),
    BrandEntity(
        name: 'Amazon',
        image:
            'https://i.pinimg.com/564x/ad/78/5a/ad785a9fb1587a496092b3d2f4e912b8.jpg'),
    BrandEntity(
        name: 'Nike',
        image:
            'https://i.pinimg.com/736x/b2/b6/e9/b2b6e9c64ce0b5cb321bc88f920047c8.jpg'),
    BrandEntity(
        name: 'Adidas',
        image:
            'https://i.pinimg.com/564x/fe/3a/62/fe3a623e558dd1744eb9167d21dc3f3d.jpg'),
    BrandEntity(
        name: 'H&M',
        image:
            'https://i.pinimg.com/736x/90/a0/31/90a03168c02854c37ae4dd23e7651fd2.jpg'),
    BrandEntity(
        name: 'Samsung',
        image:
            'https://i.pinimg.com/564x/04/57/86/0457864646c26fa060f7ec3f6b5d7c05.jpg'),
    BrandEntity(
        name: 'Sony',
        image:
            'https://i.pinimg.com/564x/33/11/47/331147faf6c9593d150e5e3f63358b77.jpg'),
    BrandEntity(
        name: 'Zara',
        image:
            'https://i.pinimg.com/564x/4d/d7/53/4dd7534d709ae944c960a52619a2184c.jpg'),
    BrandEntity(
        name: 'Calvin Klein',
        image:
            'https://i.pinimg.com/564x/ce/08/24/ce082447ecfd2ca748629cafe1d98737.jpg'),
    BrandEntity(
        name: 'Tommy Hilfiger',
        image:
            'https://i.pinimg.com/564x/49/e3/69/49e3693454bf774606235902d852182a.jpg'),
    BrandEntity(
        name: 'Gucci',
        image:
            'https://i.pinimg.com/564x/e2/e0/19/e2e01916ac0237dc1aac89ddf6c99400.jpg'),
    BrandEntity(
        name: 'Prada',
        image:
            'https://i.pinimg.com/564x/c7/43/05/c743057b54e30e1445afa126a90cd4cc.jpg'),
    BrandEntity(
        name: 'Dior',
        image:
            'https://i.pinimg.com/564x/7a/5f/48/7a5f48a2c82ad2b3cc6ef61fcfdf2e11.jpg'),
    BrandEntity(
        name: 'LC Waikiki',
        image:
            'https://i.pinimg.com/736x/2a/6a/88/2a6a889da816edb582126f1301c5c3ca.jpg'),
    BrandEntity(
        name: 'DeFacto',
        image:
            'https://i.pinimg.com/564x/d4/bc/1c/d4bc1c072d806185049ccee4aeb3161e.jpg'),
    BrandEntity(
        name: 'Lacoste',
        image:
            'https://i.pinimg.com/564x/d1/57/e1/d157e1beb7b6e3c23c2fd2b94e9f8eae.jpg'),
  ];

  List<String> sliders = [
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3
  ];

  void changeBottomNav(int index) {
    emit(HomeInitState());
    bottomNavIndex = index;
    emit(ChangeBottomNavBar());
  }

  getBrands() async {
    emit(HomeLoadingState());
    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  getProducts() async {
    emit(HomeLoadingState());
    GetProductsUseCase getProductsUseCase = GetProductsUseCase(homeDomainRepo);
    var result = await getProductsUseCase.call();
    result.fold((l) {
      emit(HomeGetProductsErrorState(l));
    }, (r) {
      products = r.data ??[];
      emit(HomeGetProductsSuccessState(r));
    });
  }

  getCategories() async {
    emit(HomeLoadingState());
    GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesUseCase(homeDomainRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategoriesSuccessState(r));
    });
  }
}
