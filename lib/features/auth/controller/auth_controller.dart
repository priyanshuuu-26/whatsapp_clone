import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/auth/repository/auth_repository.dart';
import 'dart:io';

final authControllerProvider = Provider((ref) {
  final authRespository = ref.watch(authRepositoryProvider);
  return AuthController(authRespository: authRespository, ref: ref);
});

class AuthController {
  final AuthRespository authRespository;
  final ProviderRef ref;
  AuthController({
    required this.authRespository,
    required this.ref,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRespository.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRespository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

 void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRespository.saveUserDataToFirebase(
      name: name,
      profilePic: profilePic,
      ref: ref,
      context: context,
    );
  }

}
