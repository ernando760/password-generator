import 'package:flutter/material.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/constant/text_style.dart';
import 'package:password_generator/src/shared/notifiers/bottom_navigation_bar_notifier.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({super.key, this.onChanged});

  final void Function(int value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<BottomNavigationBarNotifier>();
    return SizedBox(
      height: 61,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavigationBar(
            currentIndex: notifier.currentIndex,
            onTap: (value) {
              if (onChanged != null) {
                onChanged!(value);
                notifier.changeRoute(value);
              }
            },
            backgroundColor: red,
            selectedLabelStyle: caption10medium.copyWith(color: white),
            unselectedLabelStyle: caption10medium.copyWith(color: richBlack),
            selectedItemColor: white,
            unselectedItemColor: richBlack,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "inicio"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.password), label: "senhas"),
            ]),
      ),
    );
  }
}
