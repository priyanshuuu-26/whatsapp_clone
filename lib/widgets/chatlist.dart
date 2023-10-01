import 'package:flutter/material.dart';
import 'package:whatsapp_clone/info.dart';
import 'package:whatsapp_clone/widgets/message_card.dart';
import 'package:whatsapp_clone/widgets/sender_messagecard.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (messages[index]['isMe'] == true) {
          return MessageCard(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString(),
          );
         }
         return SenderMessageCard(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString(),
          );
      },
    );
  }
}
