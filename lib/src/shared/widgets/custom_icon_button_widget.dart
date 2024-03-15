import 'package:flutter/material.dart';
import 'package:password_generator/src/shared/constant/colors.dart';

class CustomIconButtonWidget extends StatelessWidget {
  const CustomIconButtonWidget(
      {super.key,
      required this.onPressed,
      required this.icon,
      this.backgroundColor,
      this.size = 24,
      this.iconColor});
  final VoidCallback onPressed;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor ?? white,
        size: size,
      ),
      style: IconButton.styleFrom(backgroundColor: backgroundColor),
    );
  }
}
