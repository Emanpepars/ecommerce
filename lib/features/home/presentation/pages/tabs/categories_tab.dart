import 'package:ecommerce/features/home/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/routes.dart';
import '../../manager/states.dart';
import '../../widgets/produt_item.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.h ,horizontal: 8.w),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 5,
                  mainAxisSpacing: 6.h,
                  crossAxisSpacing: 6.w,
                  shrinkWrap: true,
                  children: HomeCubit.get(context)
                      .products
                      .map((e) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.productDetails,
                                arguments: e);
                          },
                          child: ProductItem(e)))
                      .toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
