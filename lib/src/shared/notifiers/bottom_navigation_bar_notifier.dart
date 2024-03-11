import 'package:flutter/material.dart';

class BottomNavigationBarNotifier extends ValueNotifier<int> {
  BottomNavigationBarNotifier({currentIndex = 0}) : super(currentIndex);

  void changeIndex(int newIndex) {
    value = newIndex;
  }

  final Map<int, String> routes = {0: "/", 1: "/passwords"};

  String changeRoute(int index) {
    if (routes.containsKey(index)) {
      return routes[index]!;
    }
    return "/";
  }
}
