import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  bool isObscureText = false;
  final username=TextEditingController();
  final name=TextEditingController();
  final password=TextEditingController();
  final formKey=GlobalKey<FormState>();
  updateOsbcureText() {
    isObscureText = !isObscureText;
    update();
  }

  register(){
    if(formKey.currentState!.validate()){
      
    }
  }
}
