import 'package:whatsapp_clone/common/enums/message_enum.dart';

class Message {
  final String senderId;
  final String recieverId;
  final String text;
  final MessageEnum type;
  final DateTime timeSent;
  final String messageId;
  final bool isSeen;

  Message(this.senderId, this.recieverId, this.text, this.type, this.timeSent,
      this.messageId, this.isSeen);
}
