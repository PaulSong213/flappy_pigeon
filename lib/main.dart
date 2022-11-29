import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/game/main_game.dart';

void main() {
  final game = MainGame();
  runApp(GameWidget(game: game));
}
