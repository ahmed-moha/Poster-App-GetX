import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:poster_app/constants.dart';
import 'package:poster_app/controllers/home_controller.dart';

class AddPostView extends StatelessWidget {
   AddPostView({Key? key}) : super(key: key);
   final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (cont) {
        return ModalProgressHUD(
          inAsyncCall: cont.isPostLoading,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "Add Post",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder<HomeController>(builder: (cont) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(12),
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(12)),
                      child: cont.image == null
                          ? InkWell(
                              onTap: () =>cont.pickImage(),
                              child: const Icon(
                                IconlyLight.camera,
                                size: 55,
                                color: kPrimaryColor,
                              ),
                            )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.file(File(cont.image!.path)),
                              ),
                              TextButton(onPressed: ()=>cont.clearIMage(), child: const Text("Clear"))
                            ]),
                    );
                  }),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    margin: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: controller.post,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'Write Post...',
                          hintStyle: const TextStyle(
                            color: kPrimaryColor,
                          ),
                          border: const OutlineInputBorder(),
                          focusColor: kPrimaryColor,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                              ))),
                    ),
                  ),
                 // const Spacer(),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.all(12.0),
                        height: 65,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () =>controller.addPost(),
                          child: const Text('Submit'),
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
