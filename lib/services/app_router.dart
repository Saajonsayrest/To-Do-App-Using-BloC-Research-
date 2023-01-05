import 'package:flutter/material.dart';
import 'package:todo_app_bloc/screens/recycle_bin.dart';
import 'package:todo_app_bloc/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case TaskScreen.id:
        return MaterialPageRoute(builder: (_) => TaskScreen());
      default:
        return null;
    }
  }
}
