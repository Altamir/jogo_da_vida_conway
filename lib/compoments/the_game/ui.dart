import 'package:flutter/material.dart';
import 'package:jogo_da_vida/compoments/the_game/controller.dart';

import 'game_state.dart';

class TheGame extends StatelessWidget {
  const TheGame({super.key, required this.controller});

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<IGameState>(
        stream: controller.stream,
        initialData: controller.initialState,
        builder: (context, snapshot) {
          IGameState state = snapshot.data!;

          if (state is GameStateInitial) {
          return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Inicie uma nova geração para o Game",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.start(100);
                  },
                  child: const Text("Iniciar"),
                ),
              ],
            );
          }

          if (state is GameStateFinish) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Geração: ${state.actualGeneration} / ${state.finalGeneration}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.start(100);
                  },
                  child: const Text("Reiniciar"),
                ),
                _Grid(
                  state: state,
                ),
              ],
            );
          }

          if (state is GameState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Geração: ${state!.actualGeneration} / ${state.finalGeneration}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _Grid(state: state),
              ],
            );
          }

          return const Text("Algo que não devia acontecer acontecei");
        });
  }
}

class _Grid extends StatelessWidget {
  const _Grid({super.key, required this.state});

  final IGameState state;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10.0,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 40 * 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 40,
        ),
        itemBuilder: (BuildContext context, int index) {
          bool isBlack = state.isAlive(index);
          return Container(
            decoration: BoxDecoration(
              color: isBlack ? Colors.black : Colors.white,
              border: Border.all(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
