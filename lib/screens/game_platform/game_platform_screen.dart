import 'package:flame/components.dart';

import 'components/back_to_menu_button.dart';
import 'components/character.dart';
import 'components/game_platform_background.dart';

class GamePlatformScreen extends Component {
  static const String routeName = "game-platform";
  late final SpriteAnimationComponent _character;
  GamePlatformScreen() {
    addAll([
      GamePlatformBackground(),
      BackToMenu(),
      _character = Character(),
    ]);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _character.position = Vector2(10, (size.y / 2) - 40);
  }
}
