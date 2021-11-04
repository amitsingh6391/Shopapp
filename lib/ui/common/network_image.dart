import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class MyNetworkImage extends StatelessWidget {
  String url;
  double height;
  double width;
  MyNetworkImage({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => SpinKitDoubleBounce(
        color: AppColors.primaryColor,
        size: height,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
