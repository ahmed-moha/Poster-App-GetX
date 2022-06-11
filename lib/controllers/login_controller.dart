import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "package:http/http.dart" as http;
import 'package:poster_app/constants.dart';
import 'package:poster_app/models/user_model.dart';
import 'package:poster_app/view/home.dart';

class LoginController extends GetxController {
  bool isObscureText = false;
  bool isLoading = false;
  final box = GetStorage();
  UserModel user = UserModel();
  final username = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  updateOsbcureText() {
    isObscureText = !isObscureText;
    update();
  }

  LoginController() {
    getUser();
  }

  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        update();
        var data = {"username": username.text, "password": password.text};
        var response = await http.post(
            Uri.parse(
              "$kendpoint/user/login",
            ),
            body: jsonEncode(data),
            headers: {"Content-Type": "Application/json"});
        if (response.statusCode == 200) {
          print("SUCCESSFULLY");
          user = UserModel.fromJson(jsonDecode(response.body));
          update();
          await saveUser(user);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  Home()),
          );
          showAlert(context, content: "Welcome Mr/Ms ${user.name}");
        } else {
          final decodedData=jsonDecode(response.body);
          throw decodedData["message"];
        }
      } catch (e) {
        print(
          "LOGIN ERROR:$e",
        );
        showAlert(context, content: "$e", color: Colors.red);
      }
      isLoading = false;
      update();
    }
  }

  showAlert(BuildContext context, {required String content, Color? color}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color ?? Colors.green,
      ),
    );
  }

  getUser() {
    final hasData = box.hasData(kUserInfo);
    if (hasData) {
      final json = box.read(kUserInfo);
      if (json != null) {
        user = UserModel.fromJson(json);
        update();
      }
    }
  }

  saveUser(UserModel user) async {
    await box.remove(kUserInfo);
    await box.write(kUserInfo, user.toJson());
  }
}
