
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/modules/login/login_controller.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => controller.login(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              width: 1.5,
              color: Colors.white,
            ))),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.only(top: 11, bottom: 11),
        ),
      ),
      child: Row(children: [
        const SizedBox(
          height: 10,
          width: 16,
        ),
        Image.asset(
          'assets/images/google.png',
        ),
        SizedBox(
          width: Get.width * .2,
        ),
        const Text(
          'Entrar com o Google',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black   
            
          ),
        ),
      ]),
    );
  }
}
