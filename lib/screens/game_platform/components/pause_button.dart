import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flutter_learn/overlays/menu/menu_overlay.dart';
import 'package:flutter_learn/overlays/paused_menu/pause_menu_overlay.dart';

import '../../../game/main_game.dart';

class PauseButton extends SpriteComponent
    with TapCallbacks, HasGameRef<MainGame> {
  final String pauseButtonFileName = 'pause_btn.png';

  @override
  Future<void>? onLoad() async {
    await Flame.images.load(pauseButtonFileName);
    sprite = Sprite(Flame.images.fromCache(pauseButtonFileName));
    return super.onLoad();
  }

  PauseButton() {
    size = Vector2(40, 40);
    position = Vector2(50, 50);
    anchor = Anchor.center;
  }

  @override
  void onTapDown(TapDownEvent event) {
    scale = Vector2.all(0.90);
  }

  @override
  void onTapUp(TapUpEvent event) {
    scale = Vector2.all(1.0);
    pauseGame();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale = Vector2.all(1.0);
  }

  void pauseGame() {
    game.pauseEngine();
    game.overlays.add(PausedMenuOverlay.routeName);
  }
}
