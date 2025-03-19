
class ObjectBase {
  String _name = '';
  int healthPoint = 100;
  int attackDamage = 10;
  int defence = 10;

  // ObjectBase(this.name, this.healthPoint, this.attackDamage, this.defence);
  ObjectBase();

  int attacked(int attacked){
    healthPoint -= attacked;
    return healthPoint;
  }

  int attack(ObjectBase target){
    return target.attacked(attackDamage);
  }

  set name(String name) => _name = name;
  String get name => _name;
}