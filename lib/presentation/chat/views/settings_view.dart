import 'package:chat_openai/domain/core/interfaces/app_svg.dart';
import 'package:chat_openai/infrastructure/style.dart';
import 'package:chat_openai/presentation/chat/controllers/chat.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class SettingsView extends GetView<ChatController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 3,
      child: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(AppSVG.BASKET),
            title: Text("Clear conversations",style: TextStyleMe.textMedium16,),
          ),
          ListTile(
            leading: SvgPicture.asset(AppSVG.HUMAN),
            title: Text("Upgrade to Plus",style: TextStyleMe.textMedium16,),
            trailing: Container(
              width: 46,
              height: 20,
              decoration: BoxDecoration(
                color: Color(0xFFFBF3AD),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: Text(
                  "New",
                  style: TextStyleMe.textSemiBold12,
                ),
              ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(AppSVG.SUN),
            title: Text("Light mode",style: TextStyleMe.textMedium16,),
          ),
          ListTile(
            leading: SvgPicture.asset(AppSVG.UPDATE),
            title: Text("Updates & FAQ",style: TextStyleMe.textMedium16,),
          ),
          ListTile(
            leading: SvgPicture.asset(AppSVG.LOGOUT),
            title: Text("Logout",style: TextStyleMe.textMedium16.copyWith(color: Color(0xFFED8C8C))),
          ),

        ],
      ),
    );
  }
}
