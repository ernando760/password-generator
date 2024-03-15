import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/screens_view/screens_view.dart';

class AppRouter {
  AppRouter._();
  static const initialRoute = "/screens-views";

  static final Map<String, Widget Function(BuildContext context)> routes = {
    AppRouter.initialRoute: (context) => const ScreensViewWidget(),
  };
}
