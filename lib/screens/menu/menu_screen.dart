import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter_learn/screens/game_platform/game_platform_screen.dart';
import 'package:flutter_learn/screens/menu/components/background.dart';

import '../../game/main_game.dart';
import 'components/custom_button_component.dart';
import 'components/custom_text_component.dart';

class MenuScreen extends Component with HasGameRef<MainGame> {
  static const String routeName = "menu";
  late final TextComponent _title;
  late final CustomButtonComponent _playButton;

  MenuScreen() {
    addAll(
      [
        Background(const Color(0xff096e66)),
        _title = CustomTextComponent("Fly High Butterfly"),
        _playButton = CustomButtonComponent(
          text: 'Play',
          action: () => gameRef.router.pushNamed(GamePlatformScreen.routeName),
          color: const Color.fromARGB(255, 255, 255, 255),
          borderColor: const Color.fromARGB(120, 9, 110, 102),
        ),
      ],
    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _title.position = Vector2(size.x / 2, size.y / 3);
    _playButton.position = Vector2(size.x / 2, _title.y + 150);
  }
}
