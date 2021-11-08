import 'package:ecommerce_app/app_injector.dart';
import 'package:ecommerce_app/bloc/all_products/all_products_bloc.dart';
import 'package:ecommerce_app/res/app_colors.dart';
import 'package:ecommerce_app/ui/common/empty_screen.dart';
import 'package:ecommerce_app/ui/common/error_card.dart';
import 'package:ecommerce_app/ui/common/network_image.dart';
import 'package:ecommerce_app/ui/common/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'circle_loading.dart';

class ProductScreenBody extends StatefulWidget {
  ProductScreenBody({Key? key}) : super(key: key);

  @override
  State<ProductScreenBody> createState() => _ProductScreenBodyState();
}

class _ProductScreenBodyState extends State<ProductScreenBody> {
  final ScrollController scrollController = ScrollController();

  var allProductsBloc = getIt<AllProductsBloc>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Center(
      child: BlocConsumer<AllProductsBloc, AllProductsState>(
        listener: (context, productState) {},
        builder: (context, productState) {
          return productState.map(
            intial: (_) => CircleLoading(),
            loadInProgress: (_) => CircleLoading(),
            loadSuccess: (allProducts) {
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: allProducts.productsData.totalRecord,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 10,
                  childAspectRatio: size.width > 450
                      ? size.width / (size.height / .65)
                      : size.width / (size.height / 1.6),
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.dropShadow,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            MyNetworkImage(
                              url: allProducts
                                  .productsData.data[index].featuredImage,
                              height: size.height * 0.2,
                              width: size.height * 0.2,
                            ),
                            Positioned(
                              right: 0,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shopping_cart,
                                  size: size.height * 0.1 / 3,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        TitleText(
                          text: allProducts.productsData.data[index].slug,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            loadFailure: (_) => const ErrorCard(),
            empty: (_) => const EmptyScreen(message: "No Products Find"),
          );
        },
      ),
    );
  }
}
