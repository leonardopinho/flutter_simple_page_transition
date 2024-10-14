import 'package:flutter/material.dart';

class Fade extends PageRouteBuilder {
  final Widget page;
  final Duration animationDuration;
  final Curve curve;

  Fade({required this.page, this.animationDuration = const Duration(milliseconds: 300), this.curve = Curves.easeInOutQuint})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: curve),
            child: child,
          ),
          transitionDuration: animationDuration,
        );
}
