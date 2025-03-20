import "../object_base.dart";
import 'event.dart';

class ChangeStateEvent implements Event {
  late ObjectBase actor;
  ChangeStateEvent(this.actor);

  @override
  void act(){
    actor.changeState();
  }
}