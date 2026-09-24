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
}

/// This function asks for the players move
String getMove(String player) {
  String? validMove;

  do {
    stdout.write('$player, enter your move (rock/paper/scissors): ');
    String? input = stdin.readLineSync();

    validMove = validateMove(input);

    if (validMove == null) {
      print('Invalid Move. Please enter (rock/paper/scissors).');
    }
  } while (validMove == null);
  return validMove;
}

void main() {

  print('==== ROCK, PAPER, SCISSORS ====');
  String playerOne = getPlayerName('Player 1');
  String playerTwo = getPlayerName('Player 2');
}