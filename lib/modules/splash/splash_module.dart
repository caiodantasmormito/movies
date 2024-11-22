import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies/modules/splash/splash_bindings.dart';
import 'package:movies/modules/splash/splash_page.dart';

import '../../application/modules/module.dart';

class SplashModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    )
  ];
}
