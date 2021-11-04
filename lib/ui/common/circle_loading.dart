import 'package:flutter/material.dart';

class CircleLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );

    // Lottie.asset(
    //   "assets/lottiefiles/loading.json",
    //   width: 100,
    //   height: 100,
    // );
  }
}
