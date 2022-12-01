import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter_learn/screens/game_platform/components/enemy.dart';
import 'package:flutter_learn/screens/game_platform/game_platform_screen.dart';
import 'package:flutter_learn/screens/menu/menu_screen.dart';

class MainGame extends FlameGame with HasTappableComponents {
  late final RouterComponent router;
  static const List<String> parallaxImagesFilename = [
    "parallax/plx-1.png",
    "parallax/plx-2.png",
    "parallax/plx-3.png",
    "parallax/plx-4.png",
    "parallax/plx-5.png",
    "parallax/plx-6.png",
  ];

  @override
  Future<void>? onLoad() async {
    await Flame.images.loadAll(parallaxImagesFilename);
    // Todo : make enemies file names static and load it here
    await Flame.images.load('AngryPig/Run(36x30).png');
    await Flame.images.load('Rino/Run(52x34).png');
    Flame.device.fullScreen();
    add(
      router = RouterComponent(
        initialRoute: 'menu',
        routes: {
          MenuScreen.routeName: Route(MenuScreen.new),
          GamePlatformScreen.routeName: Route(GamePlatformScreen.new),
        },
      ),
    );
  }
}
