import 'dart:ui';

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
      //home: Teste(),
      theme: appThemeData,
      themeMode: ThemeMode.system,
      locale: Locale('pt', 'BR'),
      translationsKeys: AppTranslation.translations,
    );
  }
}

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 400,
          decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0, right: 8.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.red,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Text("Content"),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, bottom: 0.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ExpansionTile(
                              backgroundColor: Colors.white,

                              title: Text('faq[index].question', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                  child: Text(
                                    'faq[index].answer',
                                    style:TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 1.0,
                            sigmaY: 1.0,
                          ),
                          child: Center(
                            child: CircularProgressIndicator(), // replace your loading widget
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
