import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snowmanlabs/app/data/model/model.dart';
import 'package:snowmanlabs/app/utils/snackbar.dart';
import 'package:get/get.dart';

//Instance do firebase
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//nossa classe responsável por encapsular os métodos de requisições
class Provider {
  //recuperando todos os faq disponibilizados
  Stream<List<Faq>> getAll() {
    try {
      return  _firestore.collection('faq').snapshots().map((QuerySnapshot query) {
        List<Faq> retVal = List();
        query.docs.forEach((element) {
          retVal.add(Faq.fromDocumentSnapshot(element));
        });
        return retVal;
      });
    } catch(_){
      showSnacbar(msg: 'ERROR_ADD'.tr, title: "Erro!", icon: Icons.error, color: Colors.red);
    }
  }

  add(data) async {
    try{
      return await _firestore.collection('faq').add(data).then((value) {
        showSnacbar(msg: 'SUCESSO_ADD'.tr, title: "Sucesso!", icon: Icons.check_circle, color: Color(0xff46C9A7));
      });
    } catch (_) {
      showSnacbar(msg: 'ERROR_ADD'.tr, title: "Erro!", icon: Icons.error, color: Colors.red);
      rethrow;
    }
  }
}