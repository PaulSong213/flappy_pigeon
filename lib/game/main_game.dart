import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter_learn/screens/game_platform/components/character.dart';
import 'package:flutter_learn/screens/game_platform/components/enemy.dart';
import 'package:flutter_learn/screens/game_platform/game_platform_screen.dart';

class MainGame extends FlameGame
    with HasTappableComponents, HasCollisionDetection {
  late final RouterComponent router;
  static const List<String> parallaxImagesFilename = [
    "parallax/plx-1.png",
    "parallax/plx-2.png",
    "parallax/plx-3.png",
    "parallax/plx-4.png",
    "parallax/plx-5.png",
    "parallax/plx-6.png",
  ];
  late GamePlatformScreen gamePlatformScreen;

  @override
  Future<void>? onLoad() async {
    await Flame.images.load(Character.characterFileName);
    await Flame.images.load(Character.characterDeathFileName);
    await Flame.images.loadAll(parallaxImagesFilename);
    //load all enemy assets
    Enemy.enemyDetails.forEach((key, value) async {
      await Flame.images.load(value.characterFileName);
    });
    Flame.device.fullScreen();
    add(
        // router = RouterComponent(
        //   initialRoute: GamePlatformScreen.routeName,
        //   routes: {
        //     GamePlatformScreen.routeName: Route(GamePlatformScreen.new),
        //   },
        // ),
        gamePlatformScreen = GamePlatformScreen());
  }
}
