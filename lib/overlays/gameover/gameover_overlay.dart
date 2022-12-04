import 'package:flutter/material.dart';
import 'package:flutter_learn/game/main_game.dart';
import 'package:flutter_learn/screens/game_platform/game_platform_screen.dart';

import '../../screens/game_platform/components/score_board.dart';

class GameOverOverlay extends StatelessWidget {
  // Reference to parent game.
  final MainGame game;
  static const String routeName = 'Gameover';
  const GameOverOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Wrap(children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromARGB(220, 43, 87, 84),
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Game Over',
                  style: TextStyle(
                    color: whiteTextColor,
                    fontSize: 34,
                    fontFamily: 'fredoka_one',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Your Score was ${ScoreBoard.score}',
                  style: const TextStyle(
                    color: whiteTextColor,
                    fontSize: 28,
                    fontFamily: 'fredoka_one',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  height: 90,
                  child: IconButton(
                    icon: const Icon(
                      Icons.restart_alt_rounded,
                      color: Colors.white,
                      size: 90,
                    ),
                    onPressed: () {
                      game.resumeEngine();
                      game.gamePlatformScreen.restartGame();
                      game.overlays.remove(GameOverOverlay.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
