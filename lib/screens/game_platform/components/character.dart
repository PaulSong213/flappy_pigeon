import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Character extends SpriteAnimationComponent {
  // * Get character sprite dimensions on on http://www.spritecow.com/
  final String characterFileName = "dog_Walk.png";
  final String characterDeathFileName = "dog_Death.png";
  final double characterWidth = 47;
  final double characterHeight = 47;

  double groundY = 0;

  double speedY = 0.0;
  double yMax = 0.0;
  double characterAnimationStepTime = 0.1;
  final double GRAVITY = 2000;
  //Todo: Fix character going to ground when screen height is small
  Character() {
    size = Vector2(characterWidth * 3, characterHeight * 3);
  }

  @override
  Future<void>? onLoad() async {
    await Flame.images.load(characterFileName);
    await Flame.images.load(characterDeathFileName);
    run();
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
    x = 60;
    yMax = groundY;
  }

  void jump() {
    if (!isOnGround()) return;
    speedY = -1000;
  }

  @override
  void update(double dt) {
    super.update(dt);
    //final velocity = initial velocity + gravity
    speedY += GRAVITY * dt;

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
}
