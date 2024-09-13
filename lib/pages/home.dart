import 'package:flutter/material.dart';
import 'package:jogo_da_vida/compoments/the_game/controller.dart' as game;
import 'package:jogo_da_vida/widgets/header_text_life_game.dart';
import 'package:jogo_da_vida/compoments/the_game/ui.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final game.Controller _controller = game.Controller();

  @override
  Future dispose() async {
    await _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Jogo da vida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const HeaderText(),
            TheGame(controller: _controller),
          ],
        ),
      ),
    );
  }
}
