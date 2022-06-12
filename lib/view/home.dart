import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:poster_app/constants.dart';
import 'package:poster_app/controllers/login_controller.dart';
import 'package:poster_app/view/add_post.dart';

import '../controllers/home_controller.dart';
import '../widgets/posts_card.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  final login = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    print(controller.user.user.sId);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Poster App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<LoginController>(builder: (cont) {
                  return RichText(
                    text: TextSpan(
                        text: "Hi, ",
                        style: GoogleFonts.pacifico(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                        children: [
                          TextSpan(
                            text: cont.user.name,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        ]),
                  );
                }),
                const CircleAvatar(
                  backgroundImage: AssetImage("images/a.jpg"),
                )
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<HomeController>(
              builder: (cont) {
               if(cont.isLoading){
                 return const Center(child: CircularProgressIndicator(),);
               }else if(cont.posts.isEmpty){
                 return const Center(child: Text("No Posts Availabl"),);
               }else{
                  return ListView.builder(
                    itemCount: cont.posts.length,
                  itemBuilder: (context, index)=> PostCard(post: cont.posts[index]) ,
                );
               }
              }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPostView()));
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(IconlyLight.paper_upload),
      ),
    );
  }
}

