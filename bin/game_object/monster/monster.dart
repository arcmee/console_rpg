import '../object_base.dart';
import 'monster_state.dart';

enum ParsedList {
  name,
  healthPoint,
  attackDamage,
  defence,
}

class Monster extends ObjectBase{
  
  late MonsterState state;

  Monster();
  Monster.fromList(List<String> parsedList){
    super.name = parsedList[ParsedList.name.index];
    super.healthPoint = int.parse(parsedList[ParsedList.healthPoint.index]);
    super.attackDamage = int.parse(parsedList[ParsedList.attackDamage.index]);
    super.defence = int.parse(parsedList[ParsedList.defence.index]);
  }

}