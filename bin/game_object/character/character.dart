import '../object_base.dart';
enum ParsedList {
  healthPoint,
  attackDamage,
  defence,
}


class Character extends ObjectBase {
  Character();
  Character.fromList(List<String> parsedList){
    super.name = '';
    super.healthPoint = int.parse(parsedList[ParsedList.healthPoint.index]);
    super.attackDamage = int.parse(parsedList[ParsedList.attackDamage.index]);
    super.defence = int.parse(parsedList[ParsedList.defence.index]);
  }

  void setCharacterName(String name){
    super.name = name;
  }
  
}