import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/home/controller/home_controller.dart';
import 'package:password_generator/src/modules/home/repository/home_repository.dart';
import 'package:password_generator/src/modules/home/screen/home_screen.dart';
import 'package:password_generator/src/modules/passwords/controller/passwords_controller.dart';
import 'package:password_generator/src/modules/passwords/repository/passwords_repository.dart';
import 'package:password_generator/src/modules/passwords/screen/passwords_screen.dart';
import 'package:password_generator/src/modules/services/local_storage.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/notifiers/bottom_navigation_bar_notifier.dart';
import 'package:password_generator/src/shared/widgets/custom_bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';

class ScreensViewWidget extends StatelessWidget {
  const ScreensViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageController(),
      builder: (context, _) {
        final controller = context.watch<PageController>();
        return Scaffold(
          backgroundColor: richBlack,
          body: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Provider<HomeRepository>(
                  create: (context) =>
                      IHomeRepository(context.read<LocalStorage>()),
                  child: ChangeNotifierProvider(
                      create: (context) =>
                          HomeController(context.read<HomeRepository>()),
                      child: const HomeScreen())),
              Provider<PasswordsRepository>(
                create: (context) =>
                    IPasswordsRepository(context.read<LocalStorage>()),
                child: ChangeNotifierProvider(
                    create: (context) => PasswordsController(
                        context.read<PasswordsRepository>()),
                    child: const PasswordsScreen()),
              )
            ],
          ),
          bottomNavigationBar: ChangeNotifierProvider(
            create: (context) => BottomNavigationBarNotifier(),
            child: CustomBottomNavigationBarWidget(
              onChanged: (value) {
                controller.jumpToPage(value);
              },
            ),
          ),
        );
      },
    );
  }
}
