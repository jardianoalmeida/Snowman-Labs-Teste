import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snowmanlabs/app/controller/home_controller.dart';
import 'package:snowmanlabs/app/ui/screens/cadastrar/cadastrar_screen.dart';
import 'components/list_component.dart';

class HomeScreen extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff10159A),
        title: Container(
          color:  Colors.grey.withOpacity(0.7),
          child: GetX<HomeController>(
            builder: (_) {
              if (!_.isSearch) {
                return Text("TITLE_HOME_SCREEN".tr);
              } else {
                return TextField(
                  controller: _.searchCtrl,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'SEARCH_HOME_SCREEN'.tr,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _homeController.searchCtrl.clear();
                        _homeController.activeSearch();
                      },
                    ),
                  ),
                  onChanged: (value) {
                    _.searchChange(value);
                  },
                );
              }
            },
          ),
        ),
        centerTitle: true,
        actions: [
          GetX<HomeController>(
            builder: (_) {
              return !_.isSearch ? Container(
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _homeController.activeSearch(),
                ),
              ) : Container();
            },
          ),
        ],
      ),
      body: GetX<HomeController>(
        builder: (_) {
          return TodoList(
            faq: _.todos,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.yellow[500],
          onPressed: () {
            Get.to(CadastrarScreen());
          },
          textColor: Colors.white,
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Container(
                  child: new Center(
                    child: new Text(
                      "ADD_QUESTIONS".tr,
                      style: new TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                ),
                Icon(
                  Icons.add,
                  color: Color(0xff10159A),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}