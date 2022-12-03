import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_learn/screens/game_platform/components/enemy.dart';
import 'package:flutter_learn/screens/game_platform/components/game_platform_background.dart';

import '../../../game/constants.dart';

class Character extends SpriteAnimationComponent with CollisionCallbacks {
  // * Get character sprite dimensions on on http://www.spritecow.com/
  final String characterFileName = "dog_Walk.png";
  final String characterDeathFileName = "dog_Death.png";
  final double characterWidth = 47;
  final double characterHeight = 47;

  double groundY = 0;

  double speedY = 0.0;
  double yMax = 0.0;
  double characterAnimationStepTime = 0.1;
  final double gravity = 2000;
  bool isAlive = true;
  GamePlatformBackground gamePlatformBackground;
  //Todo: Fix character going to ground when screen height is small
  Character(this.gamePlatformBackground) {
    size = Vector2(characterWidth * 3, characterHeight * 3);
  }

  @override
  Future<void>? onLoad() async {
    await Flame.images.load(characterFileName);
    await Flame.images.load(characterDeathFileName);
    run();
    add(
      CircleHitbox()
        ..renderShape = true
        ..paint = Constants.borderPaint,
    );
    return super.onLoad();
  }

  void run() {
    animation = SpriteAnimation.fromFrameData(
        Flame.images.fromCache(characterFileName),
        SpriteAnimationData.sequenced(
          amount: 6,
          textureSize: Vector2(characterWidth, characterHeight),
          stepTime: characterAnimationStepTime,
        ));
  }

  void die() {
    if (!isAlive) return;
    isAlive = false;
    animation = SpriteAnimation.fromFrameData(
        Flame.images.fromCache(characterDeathFileName),
        SpriteAnimationData.variable(
          amount: 4,
          textureSize: Vector2(characterWidth, characterHeight),
          stepTimes: [0.3, 0.4, 0.5, 10],
          loop: false,
        ));
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    groundY = (size.y / 2) - 40.0;
    y = groundY;
    x = 10;
    yMax = groundY;
  }

  void jump() {
    if (!isAlive) return;
    if (!isOnGround()) return;
    speedY = -1000;
  }

  @override
  void update(double dt) {
    super.update(dt);
    //final velocity = initial velocity + gravity
    speedY += gravity * dt;

    //distance = speed * time
    y += speedY * dt;
    if (isOnGround()) {
      y = yMax;
      speedY = 0.0;
    }
  }

  bool isOnGround() {
    return (y >= yMax);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Enemy) {
      die();
      gamePlatformBackground.stop();
    }
  }
}
