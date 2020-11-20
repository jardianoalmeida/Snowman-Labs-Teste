import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snowmanlabs/app/controller/cadastrar_controller.dart';

class CadastrarScreen extends StatelessWidget {
  //final CadastrarController _cadastrarController = Get.find<CadastrarController>();
  final _cadastrarController = Get.put(CadastrarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff10159A),
        title: Text("ADD_QUESTIONS".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Card(
            elevation: 2.0,
            child: SingleChildScrollView(
              child: Form(
                key: _cadastrarController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: new EdgeInsets.only(left: 8.0, right: 8.0),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                            ),
                            child: TextFormField(
                              controller: _cadastrarController.questionCtrl,
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                labelText: "QUESTION_FIELD".tr,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'VALIDATE_FIELD'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: new EdgeInsets.only(left: 8.0, right: 8.0),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                            ),
                            child: new TextFormField(
                              controller: _cadastrarController.answerCtrl,
                              keyboardType: TextInputType.text,
                              maxLines: 8,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                                ),
                                labelText: "ASNSWER_FIELD".tr,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'VALIDATE_FIELD'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text("COLOR".tr),
                            GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: _cadastrarController.colorsData.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Column(
                                        children: <Widget>[
                                          FloatingActionButton(
                                            onPressed: () {
                                              _cadastrarController.selectedColorChange(index);
                                            },
                                            child: GetX<CadastrarController>(
                                              builder: (_) => Icon(Icons.done,
                                              color: index == _.selectedColor ? Colors.white : _.colorsData.elementAt(index),
                                              size: 28,
                                              ),
                                            ),
                                            backgroundColor: _cadastrarController.colorsData.elementAt(index),
                                            elevation: 0.0,
                                            heroTag: null,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  shrinkWrap: true,
                                ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Colors.yellow[500],
                            onPressed: () => _cadastrarController.addFaq(),
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
                                        "ADD_QUESTION".tr,
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.add, color: Color(0xff10159A),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
