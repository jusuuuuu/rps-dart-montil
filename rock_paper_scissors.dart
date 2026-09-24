import 'dart:io';

/// This function ask for the player's name
String getPlayerName(String player) {
  stdout.write('Enter $player name: ');
  String? input = stdin.readLineSync();

  String name = input?.trim() ?? '';

  if (name.isEmpty) {
    print('No name entered. Using "$player".');
    return player;
  }
  return name;
}

/// This function validates the player's input
String? validateMove(String? playerMove) {
  List<String> validMoves = ['rock', 'paper', 'scissors'];

  if (playerMove == null) {
    return null;
  }

  String move = playerMove.trim().toLowerCase();
  if (validMoves.contains(move)) {
    return move;
  }
  return null;
}

/// This function asks for the players move
String getMove(String player) {
  String? validMove;

  do {
    stdout.write('$player, enter your move (rock/paper/scissors): ');
    String? input = stdin.readLineSync();

    validMove = validateMove(input);

    if (validMove == null) {
      print('Invalid Move. Please type rock, paper, or scissors.');
    }
  } while (validMove == null);
  return validMove;
}

/// This function prints 30 blank lines to hide player one's move
void blankSpace() {
  for (int i = 1; i < 30; i++) {
    print('');
  }
}

/// This function decides which player won
String? decideWinner(String playerOne, String playerTwo) {
  if (playerOne == playerTwo) {
    return null;
  }

  if ((playerOne == 'rock' && playerTwo == 'scissors') ||
      (playerOne == 'paper' && playerTwo == 'rock') ||
      (playerOne == 'scissors' && playerTwo == 'paper')) {
    return 'Player 1';
  }
  return 'Player 2';
}

void main() {
  print('==== ROCK, PAPER, SCISSORS ====');
  String playerOne = getPlayerName('Player 1');
  String playerTwo = getPlayerName('Player 2');

  int playerOneScore = 0;
  int playerTwoScore = 0;

  int roundNumber = 1;

  String? playAgain;
  do {
    print('\n--- Round $roundNumber---');
    String playerOneMove = getMove(playerOne);
    blankSpace();
    String playerTwoMove = getMove(playerTwo);

    print('\n$playerOne chose $playerOneMove. $playerTwo chose $playerTwoMove.');
    String? winner = decideWinner(playerOneMove, playerTwoMove);

    if (winner == 'Player 1') {
      playerOneScore++;
    } else if (winner == 'Player 2') {
      playerTwoScore++;
    }

    if (winner == null) {
      print('Result: ${winner ?? "It\'s a draw!"}');
    } else if (winner == 'Player 1') {
      print('Result: $playerOne wins the round!');
    } else {
      print('Result: $playerTwo wins the round!');
    }
    print('Score -> $playerOne: $playerOneScore | $playerTwo: $playerTwoScore');

    stdout.write('\nPlay again? (y/n): ');
    String? input = stdin.readLineSync();
    playAgain = (input ?? '').trim().toLowerCase();

    roundNumber++;
  } while (playAgain != 'n');
  print('\n==== Final Score ====');
  print('$playerOne: $playerOneScore | $playerTwo: $playerTwoScore');

  if (playerOneScore > playerTwoScore) {
    print('Overall winner: $playerOne');
  } else if (playerTwoScore > playerOneScore) {
    print('Overall winner: $playerTwo');
  } else {
    print("It\'s a draw!");
  }
}
