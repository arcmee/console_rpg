import 'dart:convert';
import 'dart:io';
import 'object_base.dart';
import 'monster/monster.dart';
import  'character/character.dart';


class ObjectParser {
  final String basePath = 'lib/data/';
  final String characterDataFileName = 'character_data.txt';
  final String monsterDataFileName = 'monster_data.txt';
  final String seperateWord = '/';
  ObjectParser();


  // Future<Character>? parseCharacter() async{
  Future<Character>? parseCharacter() async{
    String parseString = await getCharacterStrings() ?? "";
    print(parseString);
    return Character.fromList(parseString.split(seperateWord));
  }

  Future<List<Monster>> parseMonsterList() async {
    List<String>? monsterStrings = await getMonsterStrings() ?? [];
    List<Monster> monsters = [];
    for(String str in monsterStrings){
      monsters.add(createMonster(str.split(seperateWord)));
    }
    return monsters;
  }

  Future<String>? getCharacterStrings(){
    try{
      var file = File('lib/data/character_data.txt');
      return file.readAsString();
    }
    catch(e){
      print(e);
      FileSystemException();
    }    
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