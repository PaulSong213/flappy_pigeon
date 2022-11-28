import 'package:flame/components.dart';

import 'components/back_to_menu_button.dart';
import 'components/game_platform_background.dart';

class GamePlatformScreen extends Component {
  static const String routeName = "game-platform";
  GamePlatformScreen() {
    addAll([
      GamePlatformBackground(),
      BackToMenu(),
    ]);
  }
}
