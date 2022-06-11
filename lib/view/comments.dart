import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:poster_app/constants.dart';
import 'package:poster_app/controllers/home_controller.dart';
import 'package:poster_app/models/post_model.dart';

import '../widgets/comment_card.dart';

class CommentsView extends StatelessWidget {
  CommentsView({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'Comments',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<HomeController>(builder: (cont) {
              return ListView.builder(
                itemCount: post.comments!.length,
                itemBuilder: (context, index) =>
                    CommentCard(comment: post.comments![index]),
              );
            }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: TextField(
              controller: controller.comment,
              decoration: InputDecoration(
                  hintText: "Write Comment...",
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        post.comments!
                            .add(Comments(body: controller.comment.text));
                        controller.update();
                        controller.addComment(
                          postId: post.sId ?? "",
                          success: () {},
                        );
                      },
                      icon: const Icon(
                        IconlyLight.send,
                        color: kPrimaryColor,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
