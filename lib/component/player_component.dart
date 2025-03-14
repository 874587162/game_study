import 'package:flame/components.dart';

import '../enum/player_status.dart';
import '../trex_game.dart';

class Player extends SpriteAnimationGroupComponent<PlayerStatus> with HasGameReference<TrexGame> {

  double get centerY {
    return (game.size.y / 2) - height / 2;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    y = centerY;
    x = 60;
  }

  void toggleDebugMode() {
    debugMode = !debugMode;
  }

  void toggleState() {
    int nextIndex = (current?.index ?? 0) + 1;
    nextIndex = nextIndex % PlayerStatus.values.length;
    current = PlayerStatus.values[nextIndex];
  }

  @override
  Future<void> onLoad() async {
    _initAnimations();
  }

  void _initAnimations(){
    animations = {
      PlayerStatus.running: loadAnimation(
        size: Vector2(88.0, 90.0),
        frames: [Vector2(1514.0, 4.0), Vector2(1602.0, 4.0)],
        stepTime: 0.2,
      ),
      PlayerStatus.waiting: loadAnimation(
        size: Vector2(88.0, 90.0),
        frames: [Vector2(76.0, 6.0)],
      ),
      PlayerStatus.jumping: loadAnimation(
        size: Vector2(88.0, 90.0),
        frames: [Vector2(1338.0, 4.0)],
      ),
      PlayerStatus.crashed: loadAnimation(
        size: Vector2(88.0, 90.0),
        frames: [Vector2(1778.0, 4.0)],
      ),
      PlayerStatus.down: loadAnimation(
        size: Vector2(114.0, 90.0),
        frames: [Vector2(1866, 6.0), Vector2(1984, 6.0)],
        stepTime: 0.2,
      ),
    };
    current = PlayerStatus.waiting;
  }

  SpriteAnimation loadAnimation({
    required Vector2 size,
    required List<Vector2> frames,
    double stepTime = double.infinity,
  }) {
    return SpriteAnimation.spriteList(
      frames.map((vector) => Sprite(
        game.spriteImage,
        srcSize: size,
        srcPosition: vector,
      )).toList(),
      stepTime: stepTime,
    );
  }
}
