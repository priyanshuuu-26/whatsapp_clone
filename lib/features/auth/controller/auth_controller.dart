import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/auth/repository/auth_repository.dart';
import 'dart:io';

import 'package:whatsapp_clone/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRespository = ref.watch(authRepositoryProvider);
  return AuthController(authRespository: authRespository, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final AuthController = ref.watch(authControllerProvider);
});

class AuthController {
  final AuthRespository authRespository;
  final ProviderRef ref;
  AuthController({
    required this.authRespository,
    required this.ref,
  });

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRespository.getCurrentUserData();
  }

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

  Stream<UserModel> userDataById(String userid) {
    return authRespository.userData(userid);
  }
}
