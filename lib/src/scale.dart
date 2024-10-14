import 'package:flutter/material.dart';

class Scale extends PageRouteBuilder {
  final Widget page;
  final Duration animationDuration;
  final Curve curve;
  final Alignment alignment;

  Scale({
    required this.page,
    this.animationDuration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOutQuart,
    this.alignment = Alignment.center,
  }) : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return page;
          },
          transitionDuration: animationDuration,
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: curve),
              ),
              alignment: alignment,
              child: child,
            );
          },
        );
}
