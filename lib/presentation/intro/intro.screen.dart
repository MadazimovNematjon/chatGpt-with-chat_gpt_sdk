import 'package:chat_openai/infrastructure/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'controllers/intro.controller.dart';
import 'views/capabilities_view.dart';
import 'views/example_view.dart';
import 'views/limitations_view.dart';

class IntroScreen extends GetView<IntroController> {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 335,
              height: 167,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'assets/svg/gpt.svg',
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Welcome to\nChatGPT",
                    style: TextStyleMe.text32,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Ask anything, get yout answer",
                    style: TextStyleMe.text16,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Expanded(
            flex: 2,
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (int index) {
                controller.currentIndex.value = index;
                print(controller.currentIndex.value  );
              },
              children: [
                // Examples
                ExampleView(),
                //Capabilities
                CapabilitiesView(),
                //Limitations
                LimitationsView()
              ],
            ),
          ),

          //Indicator page
          Center(
            child: SmoothPageIndicator(
              effect: SlideEffect(
                  spacing: 12.0,
                  dotWidth: 28.0,
                  dotHeight: 2.0,
                  paintStyle: PaintingStyle.fill,
                  dotColor: Colors.grey.withOpacity(.20),
                  activeDotColor: Theme.of(context).colorScheme.onPrimary),
              controller: controller.pageController,
              count: 3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                controller.nextPage();
              },
              child: Container(
                width: 335,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Center(
                  child: Text(
                    controller.currentIndex == 2 ? "Let’s Chat" : "Next",
                    style: TextStyleMe.text18,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 26,
          )
        ],
      ),
    );
  }
}
