import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snowmanlabs/app/data/model/model.dart';
import 'package:snowmanlabs/app/data/repository/repository.dart';

class HomeController extends GetxController {
  final TextEditingController searchCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Rx<List<Faq>> todoList = Rx<List<Faq>>();
  Faq faq;

  List<Faq> get todos => todoList.value;

  RxBool _isSearch = false.obs;
  get isSearch => this._isSearch.value;
  set isSearch(value) => this._isSearch.value = value;

  activeSearch(){
    isSearch = !isSearch;
    getAll();
  }

  searchChange(value) {
    if (value.isEmpty || value == '') {
      getAll();
    } else {
      todoList.value.forEach((x) {
        if (x.question.contains(value) || x.answer.contains(value)){
          print("encontrado: " + x.question);
          todoList.update((value){
            value.clear();
          });
          todoList.value.add(x);
          update();
        } else {
          todoList.update((value){
            value.clear();
          });
        }
      });
    }
  }

  @override
  void onInit() {
    print("isSearch: " + isSearch.toString());
//    isSearch(false);
    getAll();
    super.onInit();
  }

  getAll(){
    todoList.bindStream(Repository().faqStream());
  }

}
