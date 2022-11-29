import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Character extends SpriteAnimationComponent {
  final String characterFileName = "dog_Walk.png";
  final double characterWidth = 47;
  final double characterHeight = 47;
  Character() {
    size = Vector2(characterWidth * 3, characterHeight * 3);
  }

  @override
  Future<void>? onLoad() async {
    await Flame.images.load(characterFileName);
    animation = SpriteAnimation.fromFrameData(
        Flame.images.fromCache(characterFileName),
        SpriteAnimationData.sequenced(
          amount: 6,
          textureSize: Vector2(characterWidth, characterHeight),
          stepTime: 0.1,
        ));
    return super.onLoad();
  }

  // * Get the values on http://www.spritecow.com/
  Sprite characterSprite(double x, double y, double width, double height) {
    return Sprite(
      Flame.images.fromCache(characterFileName),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }
}
