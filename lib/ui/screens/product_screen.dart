import 'package:ecommerce_app/app_injector.dart';
import 'package:ecommerce_app/bloc/all_products/all_products_bloc.dart';
import 'package:ecommerce_app/res/app_colors.dart';
import 'package:ecommerce_app/res/dimens.dart';
import 'package:ecommerce_app/res/string_constants.dart';
import 'package:ecommerce_app/ui/common/product_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllProductsBloc>(
      create: (context) => getIt<AllProductsBloc>()
        ..add(
          const AllProductsEvent.getAllProductsData(),
        ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Center(
            child: Text(StringsConstants.appbarTitle),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                right: Dimens.horizontal_padding,
              ),
              child: Badge(
                badgeContent: Text('3'),
                child:
                    Icon(Icons.shopping_cart, color: AppColors.backGroundColor),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: Dimens.vertical_padding - 4,
            bottom: Dimens.horizontal_padding - 4,
          ),
          child: ProductScreenBody(),
        ),
      ),
    );
  }
}
