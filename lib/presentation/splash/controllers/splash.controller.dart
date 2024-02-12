import 'package:chat_openai/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> navigateToChat() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Get.toNamed(Routes.CHAT);
  }
}
