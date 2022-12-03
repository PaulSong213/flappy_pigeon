import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreBoard extends TextComponent {
  static int score = 0;
  ScoreBoard() {
    text = score.toString();
    anchor = Anchor.center;
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        fontFamily: 'fredoka_one',
      ),
    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    y = 60;
    x = size.x / 2;
  }

  @override
  void update(double dt) {
    super.update(dt);
    score += (60 * dt).toInt();
    text = score.toString();
  }
}
