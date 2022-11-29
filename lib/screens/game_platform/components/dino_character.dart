import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class DinoCharacter extends SpriteComponent {
  final String dinoCharacterFileName = "DinoSprites - tard.png";
  DinoCharacter() {
    size = Vector2(80, 80);
  }

  @override
  Future<void>? onLoad() async {
    await Flame.images.load(dinoCharacterFileName);
    sprite = dinoSprite(4, 4, 17, 17);
    return super.onLoad();
  }

  // * Get the values on http://www.spritecow.com/
  Sprite dinoSprite(double x, double y, double width, double height) {
    return Sprite(
      Flame.images.fromCache(dinoCharacterFileName),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }
}
