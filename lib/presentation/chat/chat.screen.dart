import 'package:chat_openai/domain/core/interfaces/chat_decoration.dart';
import 'package:chat_openai/infrastructure/style.dart';
import 'package:chat_openai/presentation/chat/views/drawer_view.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';

import 'package:get/get.dart';

import 'controllers/chat.controller.dart';

class ChatScreen extends GetView<ChatController> {
  ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        "============================##############################################################==========================");
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat GPT'),
        centerTitle: true,
      ),
      body: Obx(
        () => DashChat(
          currentUser: controller.currentUser,
          typingUsers: controller.typingUser.value,
          inputOptions: InputOptions(
            inputDecoration: chatInput,
          ),
          messageOptions: MessageOptions(
            messageDecorationBuilder: (message, previousMessage, nextMessage) =>
                messageDecoration(message, controller, context),
            messageTextBuilder: (message, previousMessage, nextMessage) =>
                messageTextDecoration(message, previousMessage, nextMessage),
            showTime: true,
            showOtherUsersName: true,
            containerColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.6),
            textColor: Colors.white,
            currentUserTextColor: Colors.white,
            currentUserContainerColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onSend: (ChatMessage msg) {
            controller.getChatResponse(msg, context);
          },
          messages: controller.message.value,
        ),
      ),
      drawer: DrawerView(),
    );
  }
}

messageTextDecoration(ChatMessage message, previousMessage, nextMessage) {


  return Container(
    padding: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(message.text.toString()),
      ],
    ),
  );
}

// String extractCodeBlock(String text) {
//   RegExp regex = RegExp(r'```([\s\S]+?)```');
//   RegExpMatch? match = regex.firstMatch(text);
//
//   return match?.group(1) ?? '';

