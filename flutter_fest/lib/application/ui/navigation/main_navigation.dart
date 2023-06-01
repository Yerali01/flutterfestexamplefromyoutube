import 'package:flutter/cupertino.dart';
import 'package:flutter_fest/application/ui/screen_factory/screen_factory.dart';

abstract class Screens {
  static const main = "/";
  static const sesssionDetails = "/session_details";
}

class MainNavigation {
  final _screenFactory = ScreenFactory();
  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        Screens.main: (_) => _screenFactory.makeMainTabs(),
        Screens.sesssionDetails: (_) => _screenFactory.makeSessionDetails(),
      };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
