
import 'dart:math';

class ObjectBase {
  String _name = '';
  double healthPoint = 100;
  double attackDamage = 10;
  double defence = 10;
  int cooltime = 1000;
  double randomGap = 90;

  ObjectBase();

  double attacked(double attacked){
    healthPoint -= attacked;
    return healthPoint;
  }

  double attack(ObjectBase target){
    double damage = randomDamage;
    print('${damage.floor()}의 피해');
    return target.attacked(damage);
  }

  void changeState(){}
  
  double get randomDamage {
    return Random().nextDouble()*attackDamage/randomGap*100 + attackDamage;
  }

  set name(String name) => _name = name;
  String get name => _name;
}