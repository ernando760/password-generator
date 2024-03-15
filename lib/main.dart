import 'package:flutter/material.dart';
import 'package:password_generator/src/shared/providers/app_providers.dart';
import 'package:password_generator/src/shared/routes/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: AppProvider.providers,
      child: const AppMain(),
    ),
  );
}

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password generator',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
