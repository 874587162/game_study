import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:game_study/01/component/cloud_component.dart';
import 'package:game_study/01/component/ground_component.dart';
import 'package:game_study/01/component/obstacle_component.dart';

import 'component/player_component.dart';

class TrexGame extends FlameGame {
  late final Image spriteImage;
  late final Player player = Player();

  @override
  Future<void> onLoad() async {
    spriteImage = await Flame.images.load('trex/trex.png');
    add(CloudComponent());
    add(GroundComponent());
    add(ObstacleComponent());
    add(player);
  }

  @override
  Color backgroundColor() {
    return const Color(0xffffffff);
  }

}
