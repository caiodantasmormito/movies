import 'package:movies/application/ui/loader/loader_mixin.dart';
import 'package:movies/application/ui/messages/messages_mixin.dart';
import 'package:movies/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final LoginService _loginService;

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(
        MessageModel.info(
          title: 'Sucesso',
          message: 'Login realizado com sucesso',
        ),
      );
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(
        MessageModel.error(
          title: 'Login Error',
          message: 'Erro ao realizar login',
        ),
      );
    }
  }
}
