import '../game_object/object_parser.dart';
import '../game_object/monster/monster.dart';

class Game {
  Game();
  late ObjectParser objectParser;
  late List<Monster> monsters = [];
  bool dataLoaded = false;

  Future<bool> intialize() async{
    print("데이터 로드중");
    objectParser = ObjectParser();
    await objectParser.parseMonsterList().then((value) {
      monsters.addAll(value);
      print("데이터 로드 완료");
      return true;
    } ,);
    return false;
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