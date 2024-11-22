import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/modules/login/login_controller.dart';
import 'package:movies/widgets/login_button.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.topCenter, children: [
      Image.asset(
        'assets/images/moviesdb.png',
        height: Get.height,
        width: Get.width,
        fit: BoxFit.cover,
      ),
      Container(
        color: Colors.black45,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            SizedBox(
              width: Get.width * .9,
              height: 42,
              child: const LoginButton(),
            )
          ],
        ),
      )
    ]));
  }
}
