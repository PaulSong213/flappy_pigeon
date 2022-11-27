import 'package:flame/components.dart';

import 'components/game_platform_background.dart';

class GamePlatformScreen extends Component {
  GamePlatformScreen(){
    addAll([
      GamePlatformBackground(),
    ]);
  }
}
