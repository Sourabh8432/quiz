import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScanfold;
  final Widget tabletScanfold;
  final Widget desktopScanfold;

  ResponsiveLayout({
    required this.mobileScanfold,
    required this.tabletScanfold,
    required this.desktopScanfold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (contest, constraints) {
        if (constraints.maxWidth < 570) {
          return mobileScanfold;
        } else if (constraints.maxWidth < 1170) {
          return tabletScanfold;
        } else {
          return desktopScanfold;
        }
      },
    );
  }
}