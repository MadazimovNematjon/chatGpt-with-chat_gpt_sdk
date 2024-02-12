import 'package:chat_openai/infrastructure/style.dart';
import 'package:chat_openai/presentation/chat/controllers/chat.controller.dart';
import 'package:chat_openai/presentation/chat/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../domain/core/interfaces/app_svg.dart';

class DrawerView extends GetView<ChatController> {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF202123),
      width: 300,
      child: Column(
        children: [
          /*######################NEW CHAT######################################*/
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 40, right: 20),
              child: Column(
                children: [
                  //Button
                  Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            weight: 20,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "New Chat",
                            style: TextStyleMe.textBold16,
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey),
          SettingsView()

        ],
      ),
    );
  }
}
