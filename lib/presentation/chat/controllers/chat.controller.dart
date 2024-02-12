import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chat_openai/domain/core/interfaces/snackbar_content.dart';
import 'package:chat_openai/infrastructure/dal/services/api_key.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  //TODO: Implement ChatController

  StreamSubscription? streamSubscription;

  final controllerCode = CodeController(
    text: "",
  );


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    generateImage();
    
  }

  final currentUser =
      ChatUser(id: "0", firstName: 'Nematjon', lastName: "Madazimov");
  final chatGpt = ChatUser(id: '1', firstName: 'CHAT', lastName: "GPT");
  RxList<ChatMessage> message = <ChatMessage>[].obs;
  RxList<ChatUser> typingUser = <ChatUser>[].obs;

  final openAI = OpenAI.instance.build(
    token: api_key,
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 10)),
    enableLog: true,
  );


  Future<void> getChatResponse(ChatMessage msg,BuildContext context) async {
    print(msg.text);
    message.insert(0, msg);
    typingUser.add(chatGpt);

    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: history(msg),
      maxToken: 200,
    );

    try {
      final response = await openAI.onChatCompletion(request: request);

      for (var element in response!.choices) {
        if (element.message != null) {
          message.insert(
            0,
            ChatMessage(
              user: chatGpt,
              createdAt: DateTime.now(),
              text: element.message!.content,
            ),
          );
        }
      }
      typingUser.remove(chatGpt);
    } on OpenAIRateLimitError catch (e) {
      // typingUser.remove(chatGpt);

      int status = int.parse(e.data!.message);
      if(status == 429){
        typingUser.remove(chatGpt);

        SnackBarMessage.showMessage(context);
      }
  }}

  List<Messages> history(ChatMessage msg) {
    var messageHistory = message.reversed.map((m) {
      if (msg.user == currentUser) {
        return Messages(role: Role.user, content: msg.text);
      } else {
        return Messages(role: Role.assistant, content: msg.text);
      }
    }).toList();
    return messageHistory;
  }



  generateImage() async {
    final prompt = "dog blue red red";
    final request = GenerateImage(prompt, 2);

    try {
      final response = await openAI.generateImage(request);
      // print(response!.data!.last!.url);
      return response!.data!.last!.url.toString();
    } catch (error) {
      print("Error generating image: $error");
    }
  }












}
