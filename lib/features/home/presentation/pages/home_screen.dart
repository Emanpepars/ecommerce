import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/features/home/data/data_sources/home_data_sources.dart';
import 'package:ecommerce/features/home/presentation/manager/cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_images.dart';

class HomeScreen extends StatelessWidget {
  //LoginEntity loginEntity;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRemoteDto()
        ..getCategories()
        ..getBrands()),
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
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    alignment: Alignment.topCenter,
                    //label: const Text("4"),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
              title: Image.asset(
                AppImages.logo,
                width: 66.w,
                color: AppColors.primary,
                height: 22.h,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: HomeCubit.get(context).bottomNavIndex,
              onTap: (value) {
                HomeCubit.get(context).changeNavIndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "",
                  backgroundColor: AppColors.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  label: "",
                  backgroundColor: AppColors.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: "",
                  backgroundColor: AppColors.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
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
