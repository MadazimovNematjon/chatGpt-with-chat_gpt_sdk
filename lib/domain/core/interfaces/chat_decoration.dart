import 'package:chat_openai/infrastructure/style.dart';
import 'package:flutter/material.dart';

InputDecoration chatInput = InputDecoration(
  hintText: "Write ...",
  hintStyle: TextStyleMe.textSemiBold16,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(width: 2, color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(width: 2, color: Colors.white),
  ),
  fillColor: Colors.grey.withOpacity(0.32),
  filled: true,
);

BoxDecoration messageDecoration(message, controller, context) => BoxDecoration(
  borderRadius: message!.user != controller.chatGpt
      ? BorderRadius.only(
    bottomLeft: Radius.circular(8),
    topRight: Radius.circular(8),
    topLeft: Radius.circular(8),
  )
      : BorderRadius.only(
    bottomRight: Radius.circular(8),
    topRight: Radius.circular(8),
    topLeft: Radius.circular(8),
  ),
  color: message!.user != controller.chatGpt
      ? Theme.of(context).colorScheme.onPrimary
      : Colors.grey.withOpacity(.20),
);