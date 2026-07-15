import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void updateSearch(String value) {
    state = value;
  }

  void clearSearch() {
    state = "";
  }
}
