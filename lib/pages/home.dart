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
  ElementView elementView = ElementView.sobre;

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
              ChoiceViewElement(onElementChange: (element) {
                setState(() {
                  elementView = element;
                });
              }),
              Visibility(
                visible: elementView == ElementView.sobre,
                child: const HeaderText(),
              ),
              Visibility(
                visible: elementView == ElementView.game,
                child: TheGame(controller: _controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ElementView { sobre, game, regras }

class ChoiceViewElement extends StatefulWidget {
  const ChoiceViewElement({super.key, required this.onElementChange});

  final void Function(ElementView)? onElementChange;

  @override
  State<ChoiceViewElement> createState() => _ChoiceViewElementState();
}

class _ChoiceViewElementState extends State<ChoiceViewElement> {
  ElementView elementView = ElementView.sobre;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SegmentedButton<ElementView>(
          segments: const <ButtonSegment<ElementView>>[
            ButtonSegment<ElementView>(
              value: ElementView.sobre,
              label: Text("Sobre"),
              icon: Icon(Icons.folder),
              enabled: true,
            ),
            ButtonSegment<ElementView>(
              value: ElementView.regras,
              label: Text("Regras"),
              icon: Icon(Icons.security),
              enabled: true,
            ),
            ButtonSegment<ElementView>(
              value: ElementView.game,
              label: Text("Game"),
              icon: Icon(Icons.gamepad),
              enabled: true,
            ),
          ],
          selected: <ElementView>{
            elementView
          },
          onSelectionChanged: (selected) {
            setState(() {
              elementView = selected.first;
              if (widget.onElementChange != null) {
                widget.onElementChange!(selected.first);
              }
            });
          }),
    );
  }
}
