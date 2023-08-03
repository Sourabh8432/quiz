import 'package:flutter/material.dart';
import 'package:webquestion/responsive.dart';
import 'package:webquestion/screen/desktop/desktop_home.dart';
import 'package:webquestion/screen/mobile/mobile_home.dart';
import 'package:webquestion/screen/tablet/tablet_home.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScanfold: const mobileScanfold(),
        tabletScanfold: const tabletScanfold(),
        desktopScanfold: const desktopScanfold());
  }
}

