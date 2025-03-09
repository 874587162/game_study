import 'package:flame/components.dart';

import '../trex_game.dart';

enum PlayerStatus {
  waiting, // 等待
  running, // 奔跑
  jumping, // 跳跃
  down, // 下落
  crashed, // 冲刺
}

