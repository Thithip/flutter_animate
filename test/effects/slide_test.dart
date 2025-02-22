import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../tester_extensions.dart';

void main() {
  testWidgets('basic slide', (tester) async {
    final animation = const FlutterLogo().animate().slide(
          duration: 1.seconds,
          begin: Offset.zero,
          end: const Offset(1, 2),
        );
    // check halfway
    await tester.pumpAnimation(animation, initialDelay: 500.ms);
    tester.expectWidgetWithDouble<SlideTransition>(
        (ft) => ft.position.value.dx, .5, 'slideX');
    tester.expectWidgetWithDouble<SlideTransition>(
        (ft) => ft.position.value.dy, 1, 'slideY');
  });
}
