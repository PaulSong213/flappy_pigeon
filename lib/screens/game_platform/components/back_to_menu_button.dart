import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/screens/menu/menu_screen.dart';

import '../../../main_game.dart';

class BackToMenu extends SpriteComponent
    with TapCallbacks, HasGameRef<MainGame> {
  final String backButtonFileName = 'back-arrow.png';

  @override
  Future<void>? onLoad() async {
    await Flame.images.load(backButtonFileName);
    sprite = Sprite(Flame.images.fromCache(backButtonFileName));
    return super.onLoad();
  }

  BackToMenu() {
    size = Vector2(60, 60);
    position = Vector2(20, 40);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    add(this);
  }

  @override
  void onTapDown(TapDownEvent event) {
    scale = Vector2.all(0.95);
  }

  @override
  void onTapUp(TapUpEvent event) {
    scale = Vector2.all(1.0);
    backToMenu();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale = Vector2.all(1.0);
  }

  void backToMenu() {
    gameRef.router.pushNamed(MenuScreen.routeName);
  }
}
