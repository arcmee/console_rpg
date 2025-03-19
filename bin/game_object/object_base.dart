
class ObjectBase {
  String name = '';
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
}