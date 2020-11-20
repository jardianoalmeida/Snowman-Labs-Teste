import 'package:get/get.dart';
import 'package:snowmanlabs/app/controller/cadastrar_controller.dart';

class CadastrarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CadastrarController>(() => CadastrarController());
  }
}
