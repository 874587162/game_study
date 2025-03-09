import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:game_study/trex_game.dart';

void main() {
  runApp(
    GameWidget(
      game: TrexGame(),
    ),
  );
}
