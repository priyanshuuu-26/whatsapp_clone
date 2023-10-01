import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/color.dart';

class WebProfilebar extends StatelessWidget {
  const WebProfilebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: dividerColor,
          ),
        ),
        color: webAppBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async {
              try {
                await FirebaseFirestore.instance
                    .collection('users')
                    .add({"web": "fasfafasfafasf"});
                log("added");
              } catch (e) {
                log(e.toString());
              }
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://t3.ftcdn.net/jpg/03/52/60/98/360_F_352609871_MKwRBG1LAVHOAtTTOlss4qALCgv64qSH.jpg'),
              radius: 25,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
