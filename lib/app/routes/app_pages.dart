import 'package:get/route_manager.dart';
import 'package:snowmanlabs/app/bindings/cadastrar_binding.dart';
import 'package:snowmanlabs/app/bindings/home_binding.dart';
import 'package:snowmanlabs/app/routes/app_routes.dart';
import 'file:///C:/Users/Developer/AndroidStudioProjects/snowmanlabs/lib/app/ui/screens/home/home_screen.dart';
import 'file:///C:/Users/Developer/AndroidStudioProjects/snowmanlabs/lib/app/ui/screens/splash/splash_screen.dart';
import 'package:snowmanlabs/app/ui/screens/cadastrar/cadastrar_screen.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => SplashScreenn(),),
    GetPage(name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(name: Routes.CADASTRAR, page: () => CadastrarScreen(), binding: CadastrarBinding(), transition: Transition.fade),
  ];
}
