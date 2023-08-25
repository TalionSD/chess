import 'package:chess/components/piece.dart';
import 'package:chess/components/square.dart';
import 'package:chess/helper/heloer_methods.dart';
import 'package:chess/utils/colors.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  /// A 2-dimensional list representing the chessboard,
  /// with each position possibly containing a chess piece
  late List<List<ChessPiece?>> board;

  @override
  void initState() {
    _initializedBoard();
    super.initState();
  }

  // INITIALIZE BOARD
  void _initializedBoard() {
    // initialize the board with nulls, meaning no pieces in those positions
    List<List<ChessPiece?>> newBoard = List.generate(
      8,
      (index) => List.generate(8, (index) => null),
    );

    // Place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
        type: ChessPieceType.pwan,
        isWhite: false,
        imagePath: 'assets/images/pwan.png',
      );
      newBoard[6][i] = ChessPiece(
        type: ChessPieceType.pwan,
        isWhite: true,
        imagePath: 'assets/images/pwan.png',
      );
    }
    // Place rooks

    // Place knight

    // Place bishope

    // Place quuen

    // Place king

    board = newBoard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8 * 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (context, index) {
          // get the row and col position of this square
          int row = index ~/ 8;
          int col = index % 8;

          //create a piece
          ChessPiece myPawn = ChessPiece(
            type: ChessPieceType.pwan,
            isWhite: true,
            imagePath: 'assets/images/pwan.png',
          );
          return Square(
            isWhite: isWhite(index),
            piece: board[row][col],
          );
        },
      ),
    );
  }
}
