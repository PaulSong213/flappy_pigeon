import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/game/main_game.dart';
import 'package:flutter_learn/overlays/gameover/gameover_overlay.dart';
import 'package:flutter_learn/overlays/menu/menu_overlay.dart';

import 'overlays/paused_menu/pause_menu_overlay.dart';

void main() {
  final game = MainGame();
  runApp(GameWidget(
    game: game,
    overlayBuilderMap: {
      'MainMenu': (_, g) => MenuOverlay(game: game),
      PausedMenuOverlay.routeName: (_, g) => PausedMenuOverlay(game: game),
      GameOverOverlay.routeName: (_, g) => GameOverOverlay(game: game),
    },
    // initialActiveOverlays: const ['MenuOverlay'],
  ));
}
