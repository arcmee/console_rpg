import 'event.dart';
import '../character/skill.dart';


class SkillEvent implements Event{
  Skill skill;

  SkillEvent(this.skill);

  @override
  void act() {
    skill.apply();
  }
}