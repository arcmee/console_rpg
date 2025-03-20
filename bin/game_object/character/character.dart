import '../object_base.dart';
import 'heal.dart';
import 'skill.dart';
import 'frenze.dart';
import 'convertion.dart';

enum ParsedList {
  healthPoint,
  mana,
  attackDamage,
  defence,
  cooltime,
}

enum State{
  normal,
  defence,
}


class Character extends ObjectBase {
  State characterState = State.normal;
  double mana = 0;
  Character();
  Character.fromList(List<String> parsedList){
    super.name = '';
    super.healthPoint = double.parse(parsedList[ParsedList.healthPoint.index]);
    mana = double.parse(parsedList[ParsedList.mana.index]);
    super.attackDamage = double.parse(parsedList[ParsedList.attackDamage.index]);
    super.defence = double.parse(parsedList[ParsedList.defence.index]);
    super.cooltime = int.parse(parsedList[ParsedList.cooltime.index]);
  }

  void setCharacterName(String name){
    super.name = name;
  }

  @override
  double attacked(double attacked){
    if(characterState == State.normal){
      healthPoint -= attacked;
    }
    else if(characterState == State.defence){
      healthPoint -= attacked - attacked*defence/100;
    }
    else{
      healthPoint -= attacked;
    }

    return healthPoint;
  }

  @override
  void changeState(){
    if(characterState == State.normal){
      print('방어모드');
      characterState = State.defence;
    }
    else{
      print('기본모드');
      characterState = State.normal;
    }
  }



  String get mode {
    if(characterState == State.defence){
      return '방어';
    }else {
      return '기본';
    }
  }

  Skill heal(){
    return Heal(this);
  }

  Skill convertion(){
    return Convertion(this);
  }

  Skill frenze(){
    return Frenze(this);
  }

  
}