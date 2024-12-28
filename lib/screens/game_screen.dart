import 'package:flutter/material.dart';
    import 'package:provider/provider.dart';
    import 'package:chess_game/widgets/chess_board.dart';
    import 'package:chess_game/models/game_state.dart';

    class GameScreen extends StatelessWidget {
      const GameScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chess Game'),
          ),
          body: Center(
            child: Consumer<GameState>(
              builder: (context, gameState, child) {
                return ChessBoard(
                  board: gameState.board,
                  onPieceMoved: (from, to) {
                    gameState.movePiece(from, to);
                  },
                );
              },
            ),
          ),
        );
      }
    }
