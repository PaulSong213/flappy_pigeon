// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

enum EnemyType { angryPig, rino }

class EnemyData {
  final String characterFileName;
  final double width;
  final double height;
  final int colCount;

  const EnemyData(
    this.characterFileName,
    this.width,
    this.height,
    this.colCount,
  );
}

class Enemy extends SpriteAnimationComponent {
  // * Get character sprite dimensions on on http://www.spritecow.com/
  double characterAnimationStepTime = 0.1;
  double speed = 350;
  double screenWidth = 0;

  static const Map<EnemyType, EnemyData> _enemyDetails = {
    EnemyType.angryPig: EnemyData(
      'AngryPig/Run(36x30).png',
      36,
      30,
      12,
    ),
    EnemyType.rino: EnemyData(
      'Rino/Run(52x34).png',
      52,
      34,
      6,
    ),
  };
  late EnemyData enemyData;
  //Todo: Fix enemy going to ground when screen height is small
  Enemy(EnemyType enemyType) {
    enemyData = _enemyDetails[enemyType]!;
    size = Vector2(enemyData.width * 2, enemyData.height * 2);
    run();
  }

  void run() {
    animation = SpriteAnimation.fromFrameData(
        Flame.images.fromCache(enemyData.characterFileName),
        SpriteAnimationData.sequenced(
          amount: enemyData.colCount,
          textureSize: Vector2(enemyData.width, enemyData.height),
          stepTime: characterAnimationStepTime,
        ));
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    y = (size.y / 2) + (enemyData.height * 2) - 30;
    x = size[0] + 60;
    screenWidth = size[0];
  }

  @override
  void update(double dt) {
    super.update(dt);
    x -= speed * dt;
    if (x < (-width)) {
      x = screenWidth + 60;
    }
  }
}
