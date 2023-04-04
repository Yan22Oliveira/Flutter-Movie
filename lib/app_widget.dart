import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  final appNavigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Modular.routerDelegate.setNavigatorKey(appNavigatorKey);

    return LayoutBuilder(
      builder: (context, constraints) {
        return MaterialApp.router(
          title: 'Flutter Movie',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        );
      },
    );
  }

}