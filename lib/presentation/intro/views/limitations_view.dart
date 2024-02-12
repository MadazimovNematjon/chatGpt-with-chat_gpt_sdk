import 'package:chat_openai/infrastructure/style.dart';
import 'package:chat_openai/presentation/intro/controllers/intro.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class LimitationsView extends GetView<IntroController> {
  const LimitationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svg/limitation.svg',
            height: 20,
            width: 20,
            color: Colors.white,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Limitations",
            style: TextStyleMe.textMedium20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.limitations.length,
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
                      controller.limitations[index],
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
