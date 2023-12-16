import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/core/constants/app_constants.dart';

class SessionStateNotifier extends StateNotifier<String> {
  SessionStateNotifier() : super(kEmptyString);

  bool isSuperAdmin = true;

  void setSession(String session) {
    state = session;
  }

  void clearSession() {
    state = kEmptyString;
    isSuperAdmin = true;
  }
}

final sessionState = StateNotifierProvider<SessionStateNotifier, String> (
    (ref) => SessionStateNotifier());

final sessionStateProvider = Provider((ref) => ref.watch(sessionState));
