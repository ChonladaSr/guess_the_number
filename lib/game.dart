// ignore_for_file: avoid_print
import 'dart:math';

// enumeration
enum GuessResult { correct, tooHigh, tooLow }

class Game {
  //ชื่อคลาสไม่จำเป็นต้องเป็นชื่อเดียวกันกับไฟล์
  final int answer;
  //final String play;

  int _totalGuesses = 0;

  Game({int maxRandom = 100}) : answer = Random().nextInt(maxRandom) + 1 {
    print('Answer is $answer');
  }

  GuessResult doGuess(int guess) {
    _totalGuesses++;
    if (guess == answer) {
      return GuessResult.correct;
    } else if (guess > answer) {
      return GuessResult.tooHigh;
    } else {
      return GuessResult.tooLow;
    }
  }

  // getter method
  int getTotalGuesses() {
    return _totalGuesses;
  }

  int get totalGuesses {
    return _totalGuesses;
  }
}
