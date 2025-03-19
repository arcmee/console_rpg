import '../game_object/object_parser.dart';
import '../game_object/monster/monster.dart';
import '../game_object/character/character.dart';

class Game {
  Game();
  late ObjectParser objectParser;
  late List<Monster> monsters = [];
  late Character character;
  bool dataLoaded = false;

  Future<bool> intialize() async{
    print("데이터 로드중");
    objectParser = ObjectParser();
    await objectParser.parseMonsterList().then((value) {
      monsters.addAll(value);
      print("몬스터 데이터 로드 완료");
    } ,);
    await objectParser.parseCharacter()!.then((value) {
      character = value;
    },);

    return true;
  }

  void setCharacterName(String name){
    
  }

  void printMonsters(){
    if(monsters.isNotEmpty){
      monsters.forEach((val) => print(val.name));
    }
  }
  

  int run(){
    
    return 0;
  }
}