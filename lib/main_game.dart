import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter_learn/screens/game_platform/game_platform_screen.dart';
import 'package:flutter_learn/screens/menu/menu_screen.dart';

class MainGame extends FlameGame with HasTappableComponents {
  late final RouterComponent router;

  @override
  Future<void>? onLoad() {
    add(
      router = RouterComponent(
        initialRoute: 'menu',
        routes: {
          MenuScreen.routeName: Route(MenuScreen.new),
          GamePlatformScreen.routeName: Route(GamePlatformScreen.new),
        },
      ),
    );
    return null;
  }
}
