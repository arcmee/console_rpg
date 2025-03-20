import 'skill.dart';

class Convertion extends Skill{
  Convertion(super.character);

  @override
  void apply() {
    print('컨버젼 스킬 사용 체력을 마나로!');
    character.healthPoint -= character.healthPoint/10;
    character.mana += 50;
  }
}