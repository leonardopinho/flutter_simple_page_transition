import 'package:flutter/material.dart';

class SlideBottomTop extends PageRouteBuilder {
  final Widget page;
  final Duration animationDuration;
  final Curve curve;

  SlideBottomTop({required this.page, this.animationDuration = const Duration(milliseconds: 800), this.curve = Curves.easeInOutQuart})
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
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: curve),
        ),
        child: child,
      );
    },
  );
}
