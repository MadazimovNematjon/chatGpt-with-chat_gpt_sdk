import 'package:chat_openai/infrastructure/navigation/routes.dart';
import 'package:chat_openai/presentation/chat/chat.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController


  @override
  void onInit() {
    super.onInit();
    print("hom");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void callChat() {
    Get.to(()=>Routes.CHAT, transition: Transition.fade,duration: Duration(seconds: 1));
  }
}
