import 'package:flutter/material.dart';
import 'package:plusvalia/core/theme/app_colors.dart';

class AppMainButton extends StatelessWidget {
  const AppMainButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.elevation = 0.0,
    this.elevationColor = Colors.transparent,
    this.radius = 80.0,
    this.backgroundColor = Colors.transparent,
    this.overlayColor = AppColors.whiteSolid,
    this.borderColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
  });

  final Color borderColor;
  final Widget child;
  final Function()? onPressed;
  final double elevation;
  final Color elevationColor;

  final double radius;
  final Color backgroundColor;
  final Color overlayColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(padding),
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        shadowColor: MaterialStatePropertyAll(elevationColor),
        overlayColor: MaterialStatePropertyAll(overlayColor),
        elevation: MaterialStatePropertyAll(elevation),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: borderColor,
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}
