import 'dart:collection';
import 'dart:io';

import '../game_object/object_parser.dart';
import '../game_object/monster/monster.dart';
import '../game_object/character/character.dart';
import '../game_object/event/event.dart';
import '../game_object/event/attack_event.dart';
import '../game_object/event/change_state_event.dart';
import '../game_object/character/skill.dart';
import '../game_object/event/skill_event.dart';

enum Skills {
  convertion,
  heal,
  frenze,
}

class Game {
  Game();
  late ObjectParser objectParser;
  late List<Monster> monsters = [];
  late Character character;
  bool dataLoaded = false;
  Queue<Event> eventQueue = Queue<Event>();
  bool playing = false;
  int stage = 0;
  bool stageCleared = false;
  bool gameCleared = false;
  bool gameOvered = false;
  bool saved = false;

  String saveDataPath = 'lib/data/result/';
  String saveFileName = 'result.txt';

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

  void start(){
    print("캐릭터 이름을 입력해주세요");
    String characterName = '';
    characterName = stdin.readLineSync()!;
    while(!RegExp(r'^[a-zA-Z가-힣]+$').hasMatch(characterName)){
      print("다시 캐릭터 이름을 입력해주세요");
      characterName = stdin.readLineSync()!;
    }
    
    character.setCharacterName(characterName);
  }

  void printMonsters(){
    if(monsters.isNotEmpty){
      monsters.forEach((val) => print(val.name));
    }
  }
  

  void play(){
    checkGameState();
    print('게임 시작!');
    printSkills();
    playing = true;
    eventQueue.clear();
    monsterAttack().listen((event) {
      eventQueue.add(event);
    });
    characterAttack().listen((event) {
      eventQueue.add(event);
    });
    consumeEvent().listen((val) {
    });
  }

  void run(){
  }

  Stream<Event> monsterAttack() async* {
    while(playing && !gameCleared){
      await Future.delayed(Duration(milliseconds: monsters[stage].cooltime));
      yield AttackEvent(this, monsters[stage], character);
    }
  }

  Stream<Event> characterAttack() async* {
    while(playing && !gameCleared){
      await Future.delayed(Duration(milliseconds: character.cooltime));
      yield AttackEvent(this, character, monsters[stage]);
    }
  }

  Stream<int> consumeEvent() async* {
    while(playing && !gameCleared){
      await Future.delayed(Duration(milliseconds: 100));
      while(eventQueue.isNotEmpty){
        eventQueue.first.act();
        checkGameState();
        eventQueue.removeFirst();
      }
      yield eventQueue.length;
    }
  }

  void changeCharacterState(){
    eventQueue.add(ChangeStateEvent(character));
  }

  void printState(){
    print('''${character.name}(${character.mode}):hp(${character.healthPoint.floor()})/mana:(${character.mana})
    ${monsters[stage].name}:hp(${monsters[stage].healthPoint.floor()})''');
  }

  void checkGameState(){
    if(stage >= monsters.length){
      gameClear();
    }
    else if(character.healthPoint <= 0){
      gameEnd();
    }
    else if(monsters[stage].healthPoint <= 0) {
      stageClear();
    }
  }

  void stageClear(){
    playing = false;
    stageCleared = true;
    print('${monsters[stage].name} 가 쓰러졌습니다. 스테이지 클리어');
    print('다음 스테이지로 가려면 n키를 눌러주세요');
  }
  void gameEnd(){
    playing = false;
    gameOvered = true;
    print('게임 오버 q를 눌러 종료해주세요');
  }
  void gameClear(){
    // playing = false;
    gameCleared = true;
    print('게임 클리어 수고하셨습니다 q를 눌러 종료해주세요(y를 눌러 게임결과를 저장할 수 있습니다.)');    
  }
  void nextStage(){
    if(stage < monsters.length){
      stage++;
      playing = true;
      play();
    }
  }

  void useSkill(Skills skill){
    if(skill == Skills.heal){
      eventQueue.add(SkillEvent(character.heal()));
    }
    else if(skill == Skills.convertion){
      eventQueue.add(SkillEvent(character.convertion()));
    }
    else if(skill == Skills.frenze){
      eventQueue.add(SkillEvent(character.frenze()));
    }
  }


  void printGameMenu(){
    print('[c]캐릭터 상태변경 [s]게임시작 [q]종료');
  }

  void printSkills(){
    print('[h] 힐, [v] 컨버젼 [f] 프랜지');
  }

  void saveResult(){
    if(saved){ 
      print('이미 저장 되었습니다.');
    }
    else{
      saved = true;
      print('저장 완료 q를 눌러 종료해주세요');
      File saveFile = File(saveDataPath + saveFileName);
      saveFile.writeAsStringSync('${character.name}(${character.mode}):hp(${character.healthPoint.floor()})/mana:(${character.mana}) \n', mode: FileMode.append);
    }
  }

}