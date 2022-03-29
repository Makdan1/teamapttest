
import 'package:flutter/material.dart';
import 'package:teamapttest/ui/screens/home/home_view.dart';
import 'package:teamapttest/ui/screens/home/landing_view.dart';
import 'package:teamapttest/utils/router/route_names.dart';

// Setup navigators to their screens
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Home(),
      );
    case firstScreenRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const FirstScreen(),
      );




    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute(
    {required String routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
