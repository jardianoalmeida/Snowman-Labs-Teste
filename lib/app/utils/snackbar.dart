import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnacbar({title, msg, icon, color}){
  return  Get.snackbar(title, msg,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(
        icon,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: color,
      duration: Duration(seconds: 4),
      borderRadius: 0,
      margin: EdgeInsets.all(8),
      colorText: Colors.white);
}