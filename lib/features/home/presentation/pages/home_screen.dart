import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/features/home/data/data_sources/home_data_sources.dart';
import 'package:ecommerce/features/home/presentation/manager/cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRemoteDto())
        ..getBrands()
        ..getCategories()
        ..getProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Image.asset(
                  AppImages.logo,
                  width: 66.w,
                  color: AppColors.primary,
                  height: 22.h,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    alignment: Alignment.topCenter,
                    label: Text(
                        HomeCubit.get(context).numOfItemsInCart.toString()),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.cart);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
              // actions: [
              // IconButton(
              //   onPressed: () {
              //     CacheHelper.removeData("User");
              //     Navigator.pushNamedAndRemoveUntil(
              //         context, Routes.login, (route) => false);
              //   },
              //   icon: Icon(
              //     Icons.logout,
              //     color: AppColors.primary,
              //     size: 20.sp,
              //   ),
              // ),
              // ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: HomeCubit.get(context).bottomNavIndex,
              onTap: (value) {
                HomeCubit.get(context).changeBottomNav(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "",
                  backgroundColor: AppColors.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category_outlined,
                  ),
                  label: "",
                  backgroundColor: AppColors.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  label: "",
                  backgroundColor: AppColors.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "",
                  backgroundColor: AppColors.primary,
                ),
              ],
            ),
            body: HomeCubit.get(context)
                .tabs[HomeCubit.get(context).bottomNavIndex],
          );
        },
      ),
    );
  }
}
