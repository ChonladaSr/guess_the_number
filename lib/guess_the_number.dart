// ignore_for_file: avoid_print
import 'dart:io';

import 'package:hello_flutter1/game.dart';

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
      print('Play again? (Y/N): ');
    } else if (guessResult == GuessResult.tooHigh) {
      print('║  ➜ $guess is TOO HIGH! ▲');
      print('║──────────────────────────────────────────────────');
    } else {
      print('║  ➜ $guess is TOO LOW! ▼');
      print('║──────────────────────────────────────────────────');
    }
  } while (guessResult != GuessResult.correct);
}
