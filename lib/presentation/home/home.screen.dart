import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chat_openai/domain/core/interfaces/app_svg.dart';
import 'package:chat_openai/domain/core/interfaces/snackbar_content.dart';
import 'package:chat_openai/infrastructure/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Show Awesome SnackBar'),
              onPressed: () {
                SnackBarMessage.showMessage(context);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
