import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class GamePlatformBackground extends Component {
  final _backgroundPaint = Paint()..color = const Color(0xff11a782);
  final String backgroundFileName = "game_platform_background.jpg";

  @override
  Future<void>? onLoad() async {
    await Flame.images.load(backgroundFileName);
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) async {
    Image img = Flame.images.fromCache(backgroundFileName);
    canvas.drawImage(img, const Offset(-10, -10), _backgroundPaint);
  }
}
