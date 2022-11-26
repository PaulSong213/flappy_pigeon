import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter_learn/components/background.dart';

import 'components/custom_text_component.dart';

class MenuPage extends Component {
  late final TextComponent _title;

  MenuPage() {
    addAll(
      [
        Background(const Color(0xff7d55fd)),
        _title = CostumTextComponent(),
      ],
    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _title.position = Vector2(size.x / 2, size.y / 3);
  }
}
