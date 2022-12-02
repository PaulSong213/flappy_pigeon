// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_learn/game/main_game.dart';
import 'package:flutter_learn/screens/game_platform/components/enemy.dart';
import 'package:flutter_learn/screens/game_platform/components/score_board.dart';

class EnemyManager extends Component {
  late Random _random;
  late Timer _timer;
  late int _spawnLevel;

  EnemyManager() {
    _random = Random();
    _spawnLevel = 0;
    _timer = Timer(4, repeat: true, onTick: () {
      spawnRandomEnemy();
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timer.update(dt);
    var newSpawnLevel = (ScoreBoard.score ~/ 500);
    if (_spawnLevel < newSpawnLevel) {
      _spawnLevel = newSpawnLevel;
      var newWaitTime = (4 / (1 + (0.1 * _spawnLevel)));
      _timer.stop();
      _timer = Timer(newWaitTime, repeat: true, onTick: () {
        spawnRandomEnemy();
      });
      _timer.start();
    }
  }

  @override
  void render(Canvas canvas) {}

  void spawnRandomEnemy() {
    final randomNumber = _random.nextInt(EnemyType.values.length);
    final randomEnemyType = EnemyType.values.elementAt(randomNumber);
    final newEnemy = Enemy(randomEnemyType);
    parent?.add(newEnemy);
  }

  @override
  void onMount() {
    super.onMount();
    _timer.start();
  }
}
