import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:poster_app/constants.dart';
import 'package:poster_app/controllers/login_controller.dart';
import 'package:poster_app/view/register.dart';

import '../widgets/custom_textfield.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (cont) {
        return ModalProgressHUD(
          inAsyncCall: cont.isLoading,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: const Text(
                'Sign In',
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
                        "Please enter your username and password to sign in",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
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
                    GetBuilder<LoginController>(builder: (cont) {
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
                    Container(
                      margin: const EdgeInsets.only(right: 30, top: 15),
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () => controller.login(context),
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            elevation: 0,
                            shape: const StadiumBorder()),
                        child: const Text("Sign In"),
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
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RegisterView()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: kPrimaryColor),
                    ),
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
