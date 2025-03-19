import 'dart:io';
import '../bin/game/game.dart';

void main(List<String> arguments) async{
  Game game = Game();
  await game.intialize();
  print('init');

  print('아무 키나 입력하세요 (q 입력 시 종료):');

  // stdin을 line 단위가 아닌, byte 단위로 읽어서 즉시 반응하도록 설정
  stdin.echoMode = false; // 입력된 문자를 화면에 출력하지 않음
  stdin.lineMode = false; // Enter 없이 즉시 반응하도록 설정

  stdin.listen((List<int> event) {
    String key = String.fromCharCodes(event);
    
    // 입력된 키를 출력
    print('입력한 키: $key');
    if(key == 'a'){
      game.printMonsters();
    }
    
    // 'q' 입력 시 종료
    if (key.trim() == 'q') {
      print('프로그램 종료...');
      exit(0);
    }
  });
  




}
