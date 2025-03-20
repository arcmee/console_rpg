import 'skill.dart';

class Frenze extends Skill {
  int duration = 5000;
  int manaCost = 30;

  Frenze(super.character);

  @override
  void apply(){
    if(character.mana > manaCost){
      print('프렌지! 공격빈도 감소');
      character.cooltime = (character.cooltime/2).toInt();
    }
    else{
      print('마나가 부족합니다.');
    }
    effectEnd().listen((val) {

    });
  }

  Stream<bool> effectEnd() async* {
    await Future.delayed(Duration(milliseconds: duration));
    print('프렌지 효과 종료');
    character.cooltime = character.cooltime * 2;
  }

}