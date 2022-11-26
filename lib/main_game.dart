import 'package:flame/game.dart';
import 'package:flutter_learn/components/menu/menu_page.dart';

class MainGame extends FlameGame {
  late final RouterComponent router;

  @override
  Future<void>? onLoad() {
    add(
      router = RouterComponent(
        initialRoute: 'menu',
        routes: {
          'menu': Route(MenuPage.new),
        },
      ),
    );
    return null;
  }
}
