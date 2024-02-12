import 'package:chat_openai/infrastructure/style.dart';
import 'package:chat_openai/presentation/intro/controllers/intro.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CapabilitiesView extends GetView<IntroController> {
  const CapabilitiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svg/flash.svg',
            height: 20,
            width: 20,
            color: Colors.white,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Capabilities",
            style: TextStyleMe.textMedium20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.capabilities.length,
              itemBuilder: (ctx, index) {
                return Container(
                  height: 62,
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      controller.capabilities[index],
                      style: TextStyleMe.textMedium16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
