import 'package:chat_openai/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  //TODO: Implement IntroController
  PageController pageController = PageController();
  List example = [
    "“Explain quantum computing in \nsimple terms”",
    "“Got any creative ideas for a 10 \nyear old’s birthday?”",
    "“How do I make an HTTP request \nin Javascript?”"
  ].obs;
  List capabilities = [
    "Remembers what user said earlier\n in the conversation",
    "Allows user to provide follow-up \ncorrections",
    "Trained to decline inappropriate\n requests"
  ].obs;
  List limitations = [
    "May occasionally generate\n incorrect information",
    "May occasionally produce harmful\n instructions or biased content",
    "Limited knowledge of world and\n events after 2021"
  ].obs;

  List<List> item = [];

  RxInt currentIndex = 0.obs;


  @override
  void onInit() {
    super.onInit();
    item.add(example);
    item.add(capabilities);
    item.add(limitations);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  void nextPage(){
    if (currentIndex == item.length-1) {
      print(item.length);
      Get.toNamed(Routes.CHAT);
    }
    pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }


}
