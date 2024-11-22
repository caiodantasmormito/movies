import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {

  //var controller = Get.find<SplashController>();



   const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/moviesdb.png'),
              fit: BoxFit.cover),
        ),
        child: Image.asset('assets/images/logo.png'),
      ),
      ),
    );
  }
}
