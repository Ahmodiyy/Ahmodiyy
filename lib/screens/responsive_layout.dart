import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileWidget;
  final Widget desktopWidget;
  const ResponsiveLayout(
      {required this.desktopWidget, required this.mobileWidget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return mobileWidget;
        } else {
          return desktopWidget;
        }
      },
    );
  }
}
