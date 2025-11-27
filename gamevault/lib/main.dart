import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GameVaultApp());
}

class GameVaultApp extends StatelessWidget {
  const GameVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameVault',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}
