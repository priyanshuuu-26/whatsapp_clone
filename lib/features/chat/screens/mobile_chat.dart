import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/color.dart';
import 'package:whatsapp_clone/common/widgets/loader.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/chat/widgets/bottom_chat_field.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/widgets/chatlist.dart';

class MobileChat extends ConsumerWidget {
  static const String routeName = '/mobile-chat';
  final String name;
  final String uid;
  const MobileChat({super.key, required this.name, required this.uid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log(name.toString());
    log(uid.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(name),
                    Text(
                      snapshot.data!.isOnline ? 'online' : 'offline',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                );
              }
              return const Loader();
            }),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),
          BottomChatField(),
        ],
      ),
    );
  }
}
