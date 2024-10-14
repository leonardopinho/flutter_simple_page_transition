import 'package:flutter/material.dart';

class SlideRightLeft extends PageRouteBuilder {
  final Widget page;
  final Duration animationDuration;
  final Curve curve;

  SlideRightLeft({required this.page, this.animationDuration = const Duration(milliseconds: 800), this.curve = Curves.easeInOutQuart})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionDuration: animationDuration,
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: curve),
              ),
              child: child,
            );
          },
        );
}
