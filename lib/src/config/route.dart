import 'package:flutter/material.dart';
import 'package:tele_app/src/pages/detail_page.dart';
import 'package:tele_app/src/pages/home_page.dart';
import 'package:tele_app/src/pages/splash_page.dart';
import 'package:tele_app/src/widgets/coustom_route.dart';
import 'package:tele_app/src/model/dactor_model.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => const SplashPage(),
      '/HomePage': (_) => HomePage(),
    };
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name?.split('/') ?? [];

    if (pathElements.isEmpty || pathElements[0] != '') {
      return null;
    }

    switch (pathElements[1]) {
      case "DetailPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) =>
              DetailPage(model: settings.arguments as DoctorModel),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
