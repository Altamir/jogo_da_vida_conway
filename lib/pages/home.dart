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
    final tela = MediaQuery.of(context).size.width;
    const double max = 920;
    final double boxSizeW = tela > max ? max : tela;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Jogo da vida'),
      ),
      body: Center(
        child: SizedBox(
          width: boxSizeW,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const HeaderText(),
              TheGame(controller: _controller),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(onPressed: (){}, child: const Text("Quais as regras?")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
