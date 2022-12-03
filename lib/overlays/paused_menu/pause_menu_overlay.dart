import 'package:flutter/material.dart';
import 'package:flutter_learn/game/main_game.dart';

class PausedMenuOverlay extends StatelessWidget {
  // Reference to parent game.
  final MainGame game;
  static const String routeName = 'PausedMenu';
  const PausedMenuOverlay({super.key, required this.game});

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
              color: Color.fromARGB(220, 15, 131, 19),
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Paused',
                  style: TextStyle(
                    color: whiteTextColor,
                    fontSize: 34,
                    fontFamily: 'fredoka_one',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  height: 90,
                  child: IconButton(
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 90,
                    ),
                    onPressed: () {
                      game.overlays.remove(PausedMenuOverlay.routeName);
                      game.resumeEngine();
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
