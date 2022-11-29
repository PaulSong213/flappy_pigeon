import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flutter_learn/game/main_game.dart';

class GamePlatformBackground extends ParallaxComponent {
  @override
  Future<void>? onLoad() async {
    List<ParallaxImage> parallaxImages = [
      ParallaxImage(Flame.images.fromCache(MainGame.parallaxImagesFilename[0])),
      ParallaxImage(Flame.images.fromCache(MainGame.parallaxImagesFilename[1])),
      ParallaxImage(Flame.images.fromCache(MainGame.parallaxImagesFilename[2])),
      ParallaxImage(Flame.images.fromCache(MainGame.parallaxImagesFilename[3])),
      ParallaxImage(Flame.images.fromCache(MainGame.parallaxImagesFilename[4])),
      ParallaxImage(Flame.images.fromCache(MainGame.parallaxImagesFilename[5])),
    ];
    var layers = parallaxImages.map((image) async => ParallaxLayer(
          image,
          velocityMultiplier: Vector2.all(parallaxImages.indexOf(image) * 0.3),
        ));
    parallax = Parallax(
      await Future.wait(layers),
      baseVelocity: Vector2(50, 0),
    );
    parallax?.baseVelocity = Vector2(100, 0);
    return super.onLoad();
  }
}
