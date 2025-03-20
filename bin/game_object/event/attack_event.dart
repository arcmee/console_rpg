import "event.dart";
import "../object_base.dart";
import '../../game/game.dart';


class AttackEvent implements Event{
  late Game game;
  ObjectBase target;
  ObjectBase actor;
  AttackEvent(this.game, this.actor, this.target);

  @override
  void act(){
    print('${actor.name}의 공격!');
    actor.attack(target);
    game.printState();
  }
}