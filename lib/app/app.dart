import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snowmanlabs/app/routes/app_pages.dart';
import 'package:snowmanlabs/app/routes/app_routes.dart';
import 'package:snowmanlabs/app/translations/app_translations.dart';
import 'package:snowmanlabs/app/ui/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snowman Labs - Teste',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      themeMode: ThemeMode.system,
      locale: Locale('pt', 'BR'),
      translationsKeys: AppTranslation.translations,
    );
  }
}
