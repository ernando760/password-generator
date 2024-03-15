import 'package:flutter/material.dart';
import 'package:password_generator/src/shared/routes/app_router.dart';

class BottomNavigationBarNotifier extends ValueNotifier<String> {
  String initialRoute;
  BottomNavigationBarNotifier({this.initialRoute = AppRouter.initialRoute})
      : super(initialRoute);
  int currentIndex = 0;
  void changeRoute(int index) {
    if (routes.containsKey(index)) {
      currentIndex = index;
      value = routes[index]!;
    }
  }

  late final Map<int, String> routes = {0: initialRoute, 1: "/passwords"};
}
