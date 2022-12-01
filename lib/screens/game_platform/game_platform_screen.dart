import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter_learn/screens/game_platform/components/enemy.dart';
import 'components/back_to_menu_button.dart';
import 'components/character.dart';
import 'components/game_platform_background.dart';

class GamePlatformScreen extends PositionComponent with TapCallbacks {
  static const String routeName = "game-platform";
  late final Character _character;
  late final GamePlatformBackground _gamePlatformBackground;
  GamePlatformScreen() {
    addAll([
      _gamePlatformBackground = GamePlatformBackground(),
      BackToMenu(),
      _character = Character(),
      Enemy(EnemyType.angryPig),
      // Enemy(EnemyType.rino),
    ]);
  }

  @override
  void onGameResize(Vector2 size) {
    this.size = size;
    super.onGameResize(size);
  }

  @override
  void onTapDown(TapDownEvent event) {
    _character.jump();
  }
}
