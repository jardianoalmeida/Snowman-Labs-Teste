import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snowmanlabs/app/data/repository/repository.dart';
import 'package:snowmanlabs/app/utils/HexColor.dart';
import 'package:snowmanlabs/app/utils/snackbar.dart';

class CadastrarController extends GetxController {
  final TextEditingController questionCtrl = TextEditingController();
  final TextEditingController answerCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //list de cores
  final colorsData = RxList();

  CadastrarController();

  @override
  void onInit() {
    //Por algum motivo desconhecido eu preciso disso
    questionCtrl.clear();
    answerCtrl.clear();

    colorsData.add(Color(0xff46C9A7));
    colorsData.add(Color(0xffFF7074));
    colorsData.add(Color(0xffFFBE00));
    colorsData.add(Color(0xff10159A));
    super.onInit();
  }

  @override
  void dispose() {
    questionCtrl.dispose();
    answerCtrl.dispose();
    super.dispose();
  }
  final _selectedColor = 0.obs;
  get selectedColor => this._selectedColor.value;
  set selectedColor(value) => this._selectedColor.value = value;

  selectedColorChange(value) {
    print("aqui");
    this.selectedColor = value;
    update();
  }


  void addFaq({context}) {
    if (formKey.currentState.validate()) {
      final Color color = colorsData[selectedColor];
      //print(color.toHex());
        Repository().addFaq(data: {
        'question': questionCtrl.text,
        'answer': answerCtrl.text,
        'color': color.toHex(),
      },);
      Get.back();
    }
  }
}
