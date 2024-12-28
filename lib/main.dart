import 'package:flutter/material.dart';
    import 'package:provider/provider.dart';
    import 'package:chess_game/screens/game_screen.dart';
    import 'package:chess_game/models/game_state.dart';

    void main() {
      runApp(
        ChangeNotifierProvider(
          create: (context) => GameState(),
          child: const MyApp(),
        ),
      );
    }

    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Flutter Chess',
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
          home: const GameScreen(),
        );
      }
    }
