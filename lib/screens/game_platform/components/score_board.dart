import 'package:flame/components.dart';

class ScoreBoard extends TextComponent {
  static int score = 0;
  ScoreBoard() {
    text = score.toString();
    anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    y = 40;
    x = size.x / 2;
  }

  @override
  void update(double dt) {
    super.update(dt);
    score += (60 * dt).toInt();
    text = score.toString();
  }
}
