import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poster_app/constants.dart';
import 'package:poster_app/view/home.dart';
import 'package:poster_app/view/login.dart';

void main()async {
 await GetStorage.init();
  final box=GetStorage();
  bool hasData=box.hasData(kUserInfo);
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: RegisterView(),
      home:hasData==true? Home(): LoginView(),
    ),
  );
}
