import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_cay_bahcesi/oyun_cay_bahcesi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(cayBahcesiConfig.title.length, 33);
    expect(cayBahcesiConfig.tagline.length, 33);
    for (final s in cayBahcesiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(cayBahcesiConfig.gameId, cayBahcesiId);
    expect(cayBahcesiRules.gameId, cayBahcesiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(cayBahcesiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: cayBahcesiId, optionalMechanics: cayBahcesiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(cayBahcesiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
