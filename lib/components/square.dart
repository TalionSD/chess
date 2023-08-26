import 'package:chess/components/piece.dart';
import 'package:chess/utils/colors.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isselected;
  final void Function()? onTab;

  const Square({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isselected,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    // id selected , square is green
    if (isselected) {
      squareColor = Colors.green;
    }

    // otherwise , it's white or black
    else {
      squareColor = isWhite ? forgroundColor : backgroundColor;
    }

    return GestureDetector(
      onTap: () => onTab,
      child: Container(
        color: squareColor,
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }
}
