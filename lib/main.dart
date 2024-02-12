import 'package:chat_openai/domain/core/interfaces/snackbar_content.dart';
import 'package:chat_openai/infrastructure/theme/theme_app.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: SnackBarMessage.scaffoldMessengerKey,
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: AppThemes.dark,
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.dark,

    );
  }
}
