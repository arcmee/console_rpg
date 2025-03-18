import 'dart:io';
import 'object_base.dart';


class ObjectParser {
  String basePath = '';
  String characterDataFileName = 'character_data.txt';
  String monsterDataFileName = 'monster_data.txt';
  ObjectParser();
  ObjectBase? parseCharacter(){
    var file = File('lib/data/character_data.txt');
    file.exists().then((value) => print(value));

    return null;
  }

  ObjectBase? parseMonster(){
    var file = File('lib/data/monster_data.txt');
    file.exists().then((value) => print(value));

    return null;
  }

}