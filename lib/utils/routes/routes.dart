import 'package:flutter/material.dart';
import 'package:sang/features/form/view/add_form_screen.dart';
import 'package:sang/features/form/view/empty_screen.dart';
import 'package:sang/features/form/view/hse_form_screen.dart';
import 'package:sang/features/home/view/home_screen.dart';
import 'package:sang/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic>? genericRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.homeRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case RoutesNames.hseFormScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const HseFormScreen();
          },
        );
      case RoutesNames.emptyScreen:
        final String text = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) {
            return EmptyScreen(
              title: text,
            );
          },
        );
      case RoutesNames.addFormScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const AddFormScreen();
          },
        );
      default:
        return null;
    }
  }
}
