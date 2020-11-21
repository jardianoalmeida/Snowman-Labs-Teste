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
        title: GetX<HomeController>(
        builder: (_) { return Container(
          color:  _.isSearch ? Color(0xff0F137A) : Color(0xff10159A),
          child: !_.isSearch
                 ? Text("TITLE_HOME_SCREEN".tr)
                 : TextField(
                  controller: _.searchCtrl,
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'SEARCH_HOME_SCREEN'.tr,
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search, color: Colors.white,),
                      onPressed: () {},
                    ),
                    suffixIcon: IconButton(
                          icon: Row(
                            children: [
                             // Text('| ', style: TextStyle(color: Colors.white,),),
                              Icon(Icons.clear, color: Colors.white,),
                            ],
                          ),
                          onPressed: () {
                            _homeController.searchCtrl.clear();
                            _homeController.activeSearch();
                          },
                        ),
                  ),
                  onChanged: (value) {
                    _.searchChange(value);
                  },
                ),
          );
        },
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
          return _.todos != null ? TodoList(
            faq: _.todos,
          ) : Center(child: CircularProgressIndicator(),);
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.yellow[500],
          onPressed: () {
            Get.toNamed('/cadastrar');
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
                      style: new TextStyle(color: Color(0xff10159A), fontSize: 18.0, fontWeight: FontWeight.bold),
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
