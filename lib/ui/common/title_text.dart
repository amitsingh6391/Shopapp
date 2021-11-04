import 'package:ecommerce_app/res/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleText extends StatelessWidget {
  String text;

  TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          text.length > 15
              ? Text(
                  "${text.substring(0, 15)}...",
                  style: AppTextStyles.medium15Black,
                )
              : Text(
                  text,
                  style: AppTextStyles.medium14Black,
                ),
        ],
      ),
    );
  }
}
