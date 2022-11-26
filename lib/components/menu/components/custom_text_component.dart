import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

class CostumTextComponent extends TextComponent {
  CostumTextComponent() {
    text = "Fly High Butterfly";
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 34,
        color: Color(0xFFC8FFF5),
        fontWeight: FontWeight.w800,
        fontFamily: 'fredoka_one',
      ),
    );
    anchor = Anchor.center;
  }
}
