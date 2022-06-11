import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:poster_app/controllers/register_controller.dart';
import 'package:poster_app/view/login.dart';

import '../constants.dart';
import '../widgets/custom_textfield.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (cont) {
      return ModalProgressHUD(
        inAsyncCall: cont.isLoading,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Text(
              'Sign Up',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: const Text(
                      "Please enter your Name, username and password to sign Up",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: controller.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name required";
                      }
                      return null;
                    },
                    label: "Name",
                    prefixIcon: const Icon(
                      IconlyLight.profile,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: controller.username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username required";
                      }
                      return null;
                    },
                    label: "Username",
                    prefixIcon: const Icon(
                      IconlyLight.profile,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GetBuilder<RegisterController>(builder: (cont) {
                    return CustomTextField(
                      controller: controller.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password required";
                        }
                        return null;
                      },
                      isObscureText: cont.isObscureText,
                      label: "Password",
                      prefixIcon: const Icon(
                        IconlyLight.lock,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => cont.updateOsbcureText(),
                        icon: Icon(
                          cont.isObscureText
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          size: 20,
                          color: kPrimaryColor,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () => controller.register(success: () {
                        print("SUCCESSFULLY");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginView())));
                      }),
                      style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          elevation: 0,
                          shape: const StadiumBorder()),
                      child: const Text("Sign Up"),
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("I have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
