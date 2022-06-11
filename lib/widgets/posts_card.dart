import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:jiffy/jiffy.dart';
import 'package:poster_app/models/post_model.dart';
import 'package:poster_app/view/comments.dart';

import '../constants.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key, required this.post,
  }) : super(key: key);
final PostModel post;
  @override
  Widget build(BuildContext context) {
    String date=Jiffy(post.createdDate??"").fromNow();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(color: Theme.of(context).cardColor, boxShadow: [
        BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 10),
            color: Colors.grey.shade100),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("images/a.jpg"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5, left: 8),
                      child:  Text(post.name?? 'Ahmed Mohamed'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, left: 8),
                      child:  Text(
                        date,
                        style: const TextStyle(fontSize: 8, color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  IconlyLight.show,
                  size: 14,
                  color: kPrimaryColor,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            height: 150,
            child: Image.network(
             post.photo??"",
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
            post.body??  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled ",
              style: GoogleFonts.poppins(
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    IconlyLight.heart,
                    size: 16,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CommentsView(post: post,)),);
                  },
                  child: const Icon(
                    CupertinoIcons.chat_bubble,
                    size: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
