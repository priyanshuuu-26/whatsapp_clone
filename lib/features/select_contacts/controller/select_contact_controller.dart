import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/select_contacts/repository/select_contact_repository.dart';

final getContactsProvider = FutureProvider((ref) {
  final SelectContactRepository = ref.watch(selectContactsRespositoryProvider);
  return SelectContactRepository.getContacts();
});

final selectContactControllerProvider = Provider((ref) {
  final selectContactRepository = ref.watch(selectContactsRespositoryProvider);
  return SelectContactController(
    ref: ref,
    selectContactRepository: selectContactRepository,
  );
});

class SelectContactController {
  final ProviderRef ref;
  final SelectContactRepository selectContactRepository;

  SelectContactController(
      {required this.ref, required this.selectContactRepository});

  void selectContact(Contact selectedContact, BuildContext context) {
    selectContactRepository.selectContact(selectedContact, context);
  }
}
