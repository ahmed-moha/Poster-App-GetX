import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:poster_app/constants.dart';
import 'package:poster_app/controllers/login_controller.dart';

import '../models/post_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<PostModel> posts = [];
  bool isLoading = false;
  final comment = TextEditingController();
  final user = Get.put<LoginController>(LoginController());

  getPosts() async {
    try {
      isLoading = true;
      update();
      var response = await http.get(Uri.parse("$kendpoint/post"),
          headers: {"ContentType": "Application/json"});
      if (response.statusCode == 200) {
        List decodedData = jsonDecode(response.body);
        posts = decodedData.map((e) => PostModel.fromJson(e)).toList();
        update();
      } else {
        throw response.body;
      }
    } catch (e) {
      print("POST ERROR: $e");
    }
    isLoading = false;
    update();
  }

  addComment({required String postId, required Function success}) async {
    try {
      var data = {
        "postid": postId,
        "body": comment.text,
        "user": user.user.sId
      };
      print("COMMENTS TEXT: $postId");
      var response = await http.post(Uri.parse("$kendpoint/post/comment"),
          body: jsonEncode(data), headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        success();
      } else {
        throw response.body;
      }
    } catch (e) {
      print("ADD COMMENT $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }
}
