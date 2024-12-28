import 'package:flutter/material.dart';
    import 'package:chess_game/models/piece.dart';

    class GameState extends ChangeNotifier {
      List<List<Piece?>> board = [];
      bool isWhiteTurn = true;

      GameState() {
        _initializeBoard();
      }

      void _initializeBoard() {
        board = List.generate(8, (row) => List.filled(8, null));

        // Place pawns
        for (int col = 0; col < 8; col++) {
          board[1][col] = Piece(type: 'P', isWhite: false);
          board[6][col] = Piece(type: 'P', isWhite: true);
        }

        // Place rooks
        board[0][0] = Piece(type: 'R', isWhite: false);
        board[0][7] = Piece(type: 'R', isWhite: false);
        board[7][0] = Piece(type: 'R', isWhite: true);
        board[7][7] = Piece(type: 'R', isWhite: true);

        // Place knights
        board[0][1] = Piece(type: 'N', isWhite: false);
        board[0][6] = Piece(type: 'N', isWhite: false);
        board[7][1] = Piece(type: 'N', isWhite: true);
        board[7][6] = Piece(type: 'N', isWhite: true);

        // Place bishops
        board[0][2] = Piece(type: 'B', isWhite: false);
        board[0][5] = Piece(type: 'B', isWhite: false);
        board[7][2] = Piece(type: 'B', isWhite: true);
        board[7][5] = Piece(type: 'B', isWhite: true);

        // Place queens
        board[0][3] = Piece(type: 'Q', isWhite: false);
        board[7][3] = Piece(type: 'Q', isWhite: true);

        // Place kings
        board[0][4] = Piece(type: 'K', isWhite: false);
        board[7][4] = Piece(type: 'K', isWhite: true);
      }

      void movePiece(int from, int to) {
        int fromRow = from ~/ 8;
        int fromCol = from % 8;
        int toRow = to ~/ 8;
        int toCol = to % 8;

        if (board[fromRow][fromCol] != null) {
          board[toRow][toCol] = board[fromRow][fromCol];
          board[fromRow][fromCol] = null;
          isWhiteTurn = !isWhiteTurn;
          notifyListeners();
        }
      }
    }
