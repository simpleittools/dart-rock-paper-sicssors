import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  //   choose the AI move at random
  final rng = Random();
  int playerScore = 0;
  int aiScore = 0;
//   Build a Rock Paper Scissors Game
  var play = true;
  while (play){
    stdout.write('Rock, paper, or scissors? (r/p/s)');
    final input = stdin.readLineSync();
    // if input is valid ("r", "p", "s")
    if (input == "r" || input == "p"  || input == "s") {
      var playerMove;
      if (input == 'r'){
        playerMove = Move.rock;
      } else if (input == "p") {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      print('Player selected: $playerMove');
      print('AI selected: ${aiMove.name}');
      if (playerMove == aiMove) {
        print('It\'s a draw');
        print('Player Score is: $playerScore');
        print('AI Score is: $aiScore');
      } else if (playerMove == Move.rock && aiMove == Move.scissors || playerMove == Move.paper && aiMove == Move.rock ||playerMove == Move.scissors && aiMove == Move.paper ) {
        playerScore++;
        print("Player Wins");
        print('Player Score is: $playerScore');
        print('AI Score is: $aiScore');
      } else {
        aiScore++;
        print("AI Wins");
        print('Player Score is: $playerScore');
        print('AI Score is: $aiScore');
      }
    } else if (input == 'q') {
      play = false;
    } else {
      print("invalid input");
    }
  }
}