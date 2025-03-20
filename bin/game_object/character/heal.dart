import 'skill.dart';

class Heal extends Skill{
  double amount = 50;
  double manaCost = 30;
  Heal(super.character);

  @override
  void apply() {
    if(character.mana < manaCost ){
      print('마나가 부족합니다.');
    }
    else {
      print('힐 스킬 사용!');
      character.healthPoint += amount;
      character.mana -= 30;
    }
  }
}