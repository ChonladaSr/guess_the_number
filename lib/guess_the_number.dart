// ignore_for_file: avoid_print
import 'dart:io';
import 'package:hello_flutter1/game.dart';

List<int> myList = [];
var len = myList.length;
var PlayAgian = false;

void main() {
  var game = Game();
  late GuessResult guessResult;


  print('╔══════════════════════════════════════════════════');
  print('║              GUESS THE NUMBER                    ');
  print('║──────────────────────────────────────────────────');
  do {
    stdout.write('║  Guess the number between 1 and 100 : ');

    var input = stdin.readLineSync();

    if (input == null) {
      return;
    }

    var guess = int.tryParse(input);

    if (guess == null) {
      continue;
    }

    guessResult = game.doGuess(guess);
    if (guessResult == GuessResult.correct) {
      print('║  ➜ $guess is CORRECT ❤, total guesses: ${game.totalGuesses}');
      print('║──────────────────────────────────────────────────');
      print('║                    THE END                       ');
      print('╚══════════════════════════════════════════════════');
      myList.add(game.totalGuesses);
      do {
        stdout.write('Play again? (Y/N): ');
        var choie = stdin.readLineSync();
        if (choie == 'Y' || choie == 'y') {
          PlayAgian = letsplay(choie);
        } else if (choie == 'N' || choie == 'n') {
          print('You are Played $len games');
          for (var i = 1; i <= myList.length; i++) {
            var count = myList[i-1];
            print('🚀 Game #$i: $count guesses');
          }
         exit(0);
        } else {
          continue;
        }
      } while (!PlayAgian);
    }

    if (guessResult == GuessResult.tooHigh) {
      print('║  ➜ $guess is TOO HIGH! ▲');
      print('║──────────────────────────────────────────────────');
    } else {
      print('║  ➜ $guess is TOO LOW! ▼');
      print('║──────────────────────────────────────────────────');
    }
  } while (guessResult != GuessResult.correct);
}
  letsplay(var choie){
    var game = Game();
    late GuessResult guessResult;


    print('╔══════════════════════════════════════════════════');
    print('║              GUESS THE NUMBER                    ');
    print('║──────────────────────────────────────────────────');
    do {
      stdout.write('║  Guess the number between 1 and 100 : ');

      var input = stdin.readLineSync();

      if (input == null) {
        return;
      }

      var guess = int.tryParse(input);

      if (guess == null) {
        continue;
      }

      guessResult = game.doGuess(guess);
      if (guessResult == GuessResult.correct) {
        print('║  ➜ $guess is CORRECT ❤, total guesses: ${game.totalGuesses}');
        print('║──────────────────────────────────────────────────');
        print('║                    THE END                       ');
        print('╚══════════════════════════════════════════════════');
        myList.add(game.totalGuesses);
        do {
          stdout.write('Play again? (Y/N): ');
          var choie = stdin.readLineSync();
          if (choie == 'Y' || choie == 'y') {
            PlayAgian=letsplay(choie);
          } else if (choie == 'N' || choie == 'n') {
            print('You are Played $len games');
            for (var i = 1; i <= myList.length; i++) {
              var count = myList[i-1];
              print('🚀 Game #$i: $count guesses');
            }
           exit(0);
          } else {
            continue;
          }
        } while (!PlayAgian);
      }

      if (guessResult == GuessResult.tooHigh) {
        print('║  ➜ $guess is TOO HIGH! ▲');
        print('║──────────────────────────────────────────────────');
      } else {
        print('║  ➜ $guess is TOO LOW! ▼');
        print('║──────────────────────────────────────────────────');
      }
    } while (guessResult != GuessResult.correct);
  }
