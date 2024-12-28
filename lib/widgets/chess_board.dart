import 'package:flutter/material.dart';
    import 'package:chess_game/models/piece.dart';

    class ChessBoard extends StatefulWidget {
      final List<List<Piece?>> board;
      final Function(int, int) onPieceMoved;

      const ChessBoard({super.key, required this.board, required this.onPieceMoved});

      @override
      ChessBoardState createState() => ChessBoardState();
    }

    class ChessBoardState extends State<ChessBoard> {
      int? _selectedRow;
      int? _selectedCol;

      @override
      Widget build(BuildContext context) {
        return AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 64,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (context, index) {
                int row = index ~/ 8;
                int col = index % 8;
                bool isLightSquare = (row + col) % 2 == 0;
                Color squareColor = isLightSquare ? Colors.white : Colors.brown[300]!;
                Piece? piece = widget.board[row][col];
                bool isSelected = _selectedRow == row && _selectedCol == col;

                return GestureDetector(
                  onTap: () => _handleTap(row, col),
                  child: Container(
                    color: isSelected ? Colors.blue[200] : squareColor,
                    child: piece != null
                        ? Center(
                            child: Text(
                              piece.type,
                              style: TextStyle(
                                fontSize: 32,
                                color: piece.isWhite ? Colors.white : Colors.black,
                              ),
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
          ),
        );
      }

      void _handleTap(int row, int col) {
        if (_selectedRow == null) {
          if (widget.board[row][col] != null) {
            setState(() {
              _selectedRow = row;
              _selectedCol = col;
            });
          }
        } else {
          if (_selectedRow == row && _selectedCol == col) {
            setState(() {
              _selectedRow = null;
              _selectedCol = null;
            });
          } else {
            widget.onPieceMoved(_selectedRow! * 8 + _selectedCol!, row * 8 + col);
            setState(() {
              _selectedRow = null;
              _selectedCol = null;
            });
          }
        }
      }
    }
