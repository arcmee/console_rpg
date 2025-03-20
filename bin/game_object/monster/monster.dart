import '../object_base.dart';
import 'monster_state.dart';

enum ParsedList {
  name,
  healthPoint,
  attackDamage,
  defence,
  cooltime,
}

class Monster extends ObjectBase{
  
  late MonsterState state;

  Monster();
  Monster.fromList(List<String> parsedList){
    super.name = parsedList[ParsedList.name.index];
    super.healthPoint = double.parse(parsedList[ParsedList.healthPoint.index]);
    super.attackDamage = double.parse(parsedList[ParsedList.attackDamage.index]);
    super.defence = double.parse(parsedList[ParsedList.defence.index]);
    super.cooltime = int.parse(parsedList[ParsedList.cooltime.index]);
  }

}