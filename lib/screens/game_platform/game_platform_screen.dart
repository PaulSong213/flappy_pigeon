import 'package:flame/components.dart';

import 'components/back_to_menu_button.dart';
import 'components/dino_character.dart';
import 'components/game_platform_background.dart';

class GamePlatformScreen extends Component {
  static const String routeName = "game-platform";
  late final SpriteComponent _dinoCharacter;
  GamePlatformScreen() {
    addAll([
      GamePlatformBackground(),
      BackToMenu(),
      _dinoCharacter = DinoCharacter(),
    ]);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _dinoCharacter.position = Vector2(20, (size.y / 2) - 70);
  }
}
