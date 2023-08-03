import 'package:flutter_riverpod/flutter_riverpod.dart';

class PositionNotifier extends StateNotifier<String> {
  PositionNotifier() : super('');

//stateNotifier is a great place to write widget specific business logic

  updatePosition(String title) {
    state = title;
  }
}

final positionProvider = StateNotifierProvider<PositionNotifier, String>((ref) {
  return PositionNotifier();
});
