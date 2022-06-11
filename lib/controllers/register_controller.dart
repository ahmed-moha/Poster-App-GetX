import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:poster_app/constants.dart';

class RegisterController extends GetxController {
  bool isObscureText = false;
  bool isLoading = false;
  final username = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  updateOsbcureText() {
    isObscureText = !isObscureText;
    update();
  }

  register({required Function success}) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        update();
        var data = {
          "name": name.text,
          "username": username.text,
          "password": password.text
        };
        var response = await http.post(
          Uri.parse("$kendpoint/user"),
          body: jsonEncode(data),
          headers: {"Content-Type":"Application/json"}
        );
        if(response.statusCode==200){
          
          success();
        }else{
          throw response.body;
        }
      } catch (e) {
        print("REGISTER ERROR:$e");
      }
      isLoading=false;
      update();
    }
  }
}
