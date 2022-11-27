import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

class CustomTextComponent extends TextComponent {
  final Color textColor;
  final String textContent;
  CustomTextComponent(
    this.textContent, {
    this.textColor = const Color.fromARGB(255, 255, 255, 255),
  }) {
    text = textContent;
    textRenderer = TextPaint(
      style: TextStyle(
        fontSize: 30,
        color: textColor,
        fontWeight: FontWeight.w800,
        fontFamily: 'fredoka_one',
      ),
    );
    anchor = Anchor.center;
  }
}
