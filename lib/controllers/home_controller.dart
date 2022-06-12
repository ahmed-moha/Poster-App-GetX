import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:poster_app/constants.dart';
import 'package:poster_app/controllers/login_controller.dart';

import '../models/post_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<PostModel> posts = [];
  bool isLoading = false;
  bool isPostLoading = false;
  final comment = TextEditingController();
  final post = TextEditingController();
  final user = Get.put<LoginController>(LoginController());
  File? image;

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
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        success();
      } else {
        throw response.body;
      }
    } catch (e) {
      print("ADD COMMENT $e");
    }
  }

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      image = File(result.files.single.path!);
      update();
    } else {
      // User canceled the picker
    }
  }

  clearIMage() async {
    image = null;
    update();
  }

  addPost() async {
    try {
      isPostLoading = true;
      update();
      var request = http.MultipartRequest("POST", Uri.parse("$kendpoint/post"));

      request.fields.addAll(
        {"body": post.text, "user": user.user.sId!},
      );

      //request.fields.addAll(data);
      request.files
          .add(await http.MultipartFile.fromPath("image", image!.path));
      request.headers.addAll({"Content-Type": "application/json"});
      var res = await request.send();
      var response = await http.Response.fromStream(res);

      if (response.statusCode == 200) {
        print("SUCCESS");
      } else {
        throw response.body;
      }
    } catch (e) {
      print("ADD POST ERROR: $e");
    }
    isPostLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }
}
