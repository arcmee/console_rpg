import '../object_base.dart';
enum ParsedList {
  name,
  healthPoint,
  attackDamage,
  defence,
}

class Monster extends ObjectBase{

  Monster();
  Monster.fromList(List<String> parsedList){
    super.name = parsedList[ParsedList.name.index];
    super.healthPoint = int.parse(parsedList[ParsedList.healthPoint.index]);
    super.attackDamage = int.parse(parsedList[ParsedList.attackDamage.index]);
    super.defence = int.parse(parsedList[ParsedList.defence.index]);
  }

}