import 'package:chat_openai/infrastructure/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.navigateToChat();
    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/gpt.svg',height: 108,width: 108,),
            SizedBox(height: 40,),
            Text(
              'ChatGPT',
              style: TextStyleMe.text40,
            ),
          ],
        ),
      ),
    );
  }
}
