import 'dart:io';
import '../bin/game/game.dart';

void main(List<String> arguments) async {
  Game game = Game();
  await game.intialize();
  print('init');
  game.start();
  game.printGameMenu();

  // print('아무 키나 입력하세요 (q 입력 시 종료):');

  // stdin을 line 단위가 아닌, byte 단위로 읽어서 즉시 반응하도록 설정
  stdin.echoMode = false; // 입력된 문자를 화면에 출력하지 않음
  stdin.lineMode = false; // Enter 없이 즉시 반응하도록 설정

  stdin.listen((List<int> event) {
    String key = String.fromCharCodes(event);
    // 입력된 키를 출력
    print('입력한 키: $key');
    // if(key == 'a'){
    //   game.printMonsters();
    // }
    if(key == 'c'){
      game.changeCharacterState();
    }
    if(key == 'n'){
      if(!game.playing && !game.gameCleared){
        game.nextStage();
      }
    }
    if(key == 'h'){
      if(game.playing && !game.gameCleared){
        game.useSkill(Skills.heal);
      }
    }
    if(key == 'v'){
      if(game.playing && !game.gameCleared){
        game.useSkill(Skills.convertion);
      }
    }
    if(key == 'y'){
      if(game.gameCleared){
        game.saveResult();
      }
    }
    if(key == 's'){
      if(!game.playing){
        game.play();
      }
      else{
        print('아직 스테이지 클리어 안됐어요');
      }
    }
    // 'q' 입력 시 종료
    if (key.trim() == 'q') {
      print('프로그램 종료...');
      exit(0);
    }
  });
  
  

}
