import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/widgets/error.dart';
import 'package:whatsapp_clone/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen .dart';
import 'package:whatsapp_clone/features/auth/screens/userinfo_screen.dart';
import 'package:whatsapp_clone/features/select_contacts/screens/select_contact_screen.dart';
import 'package:whatsapp_clone/features/chat/screens/mobile_chat.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LognScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LognScreen(),
      );
    case OTPscreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPscreen(
          verificationId: verificationId,
        ),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
      );
    case SelectContactScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectContactScreen(),
      );
    case MobileChat.routeName:
      final arguements = settings.arguments as Map<String, dynamic>;
      final name = arguements['name'];
      final uid = arguements['uid'];
      return MaterialPageRoute(
        builder: (context) => MobileChat(
          name: name,
          uid: uid,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\t exist'),
        ),
      );
  }
}
