import 'dart:math';
import 'dart:ui';

import 'package:devilf/game/df_math_position.dart';
import 'package:devilf/game/df_math_size.dart';
import 'package:devilf/sprite/df_sprite.dart';
import 'package:flutter/cupertino.dart';

/// 怪物精灵类
class MonsterSprite extends DFSprite {
  MonsterSprite({DFSize size = const DFSize(32, 32)})
      : super(position: DFPosition(0, 0), size: size);

  @override
  void update(double dt) {
    this.angle += dt * 0.25;
  }

  @override
  void render(Canvas canvas) {
    canvas.save();

    /// 将子精灵转换为相对坐标
    if (parent == null) {
      canvas.translate(position.x, position.y);
    } else {
      canvas.translate(position.x - parent!.size.width / 2, position.y - parent!.size.height / 2);
    }

    canvas.rotate(pi * 2 * this.angle);
    var paint = new Paint()..color = new Color(0xFFFF0000);
    canvas.drawRect(
        new Rect.fromLTWH(-size.width / 2, -size.height / 2, size.width, size.height), paint);
    canvas.restore();
  }
}