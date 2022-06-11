import 'package:flutter/material.dart';

import '../models/post_model.dart';
class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key, required this.comment,
  }) : super(key: key);
final Comments comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              blurRadius: 12,
              offset: const Offset(1, 10),
              color: Colors.grey.shade200),
        ],
      ),
      child:
           Text(comment.body??""),
    );
  }
}
