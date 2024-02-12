import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class SnackBarMessage {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  static void showMessage(BuildContext context) {
    final materialBanner = MaterialBanner(
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: 'Oh Hey!!',
        message:
        'This is an example error message that will be shown in the body of materialBanner!',
        contentType: ContentType.warning,
        color: Colors.black26,
      ),
      actions: const [SizedBox.shrink()],
      dividerColor: Colors.transparent,
    );

    scaffoldMessengerKey.currentState!
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);

    // Close the banner after 10 seconds
    Future.delayed(Duration(seconds: 10), () {
      scaffoldMessengerKey.currentState!.hideCurrentMaterialBanner();
    });
  }
}
