import 'dart:convert';
import 'dart:io';
import 'object_base.dart';
import 'monster/monster.dart';


class ObjectParser {
  final String basePath = 'lib/data/';
  final String characterDataFileName = 'character_data.txt';
  final String monsterDataFileName = 'monster_data.txt';
  final String seperateWord = '/';
  ObjectParser();
  ObjectBase? parseCharacter(){
    var file = File('lib/data/character_data.txt');
    file.exists().then((value) => print(value));
    return null;
  }

  Future<List<Monster>> parseMonsterList() async {
    List<String>monsterStrings = [];
    await getMonsterStrings()?.then((fetched) => monsterStrings = fetched);
    List<Monster> monsters = [];
    for(String str in monsterStrings){
      monsters.add(createMonster(str.split(seperateWord)));
    }
    return monsters;
  }

  Future<List<String>>? getMonsterStrings(){
    try{
      var file = File('lib/data/monster_data.txt');
      return file.readAsLines();
    }
    catch(e){
      print(e);
      FileSystemException();
    }
  }

  Future<List<String>>? test() {
    return getMonsterStrings();
  }

  Monster createMonster(List<String> strList){
    Monster monster = Monster.fromList(strList);
    return monster;
  }



}