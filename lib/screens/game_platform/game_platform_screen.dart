import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter_learn/game/main_game.dart';
import 'package:flutter_learn/screens/game_platform/components/pause_button.dart';
import 'package:flutter_learn/screens/game_platform/components/enemy_manager.dart';
import 'components/character.dart';
import 'components/game_platform_background.dart';
import 'components/score_board.dart';

class GamePlatformScreen extends PositionComponent
    with TapCallbacks, HasGameRef<MainGame> {
  static const String routeName = "game-platform";
  late final Character _character;
  late final GamePlatformBackground _gamePlatformBackground;
  late final EnemyManager _enemyManager;
  GamePlatformScreen() {
    addAll([
      _gamePlatformBackground = GamePlatformBackground(),
      PauseButton(),
      _character = Character(_gamePlatformBackground),
      ScoreBoard(),
      _enemyManager = EnemyManager(),
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
