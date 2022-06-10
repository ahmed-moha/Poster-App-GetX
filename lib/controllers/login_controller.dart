import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isObscureText = false;
  final username=TextEditingController();
  final password=TextEditingController();
  final formKey=GlobalKey<FormState>();
  updateOsbcureText() {
    isObscureText = !isObscureText;
    update();
  }

  login(){
    if(formKey.currentState!.validate()){
      
    }
  }
}
