import 'package:flutter/material.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/constant/text_style.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Container(
      alignment: Alignment.center,
      width: sizeOf.width * .8,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 30),
      decoration:
          BoxDecoration(color: red, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: headLine22Bold.copyWith(color: white),
      ),
    );
  }
}
