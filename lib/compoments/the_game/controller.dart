import 'dart:async';
import 'dart:math';

import 'package:jogo_da_vida/compoments/the_game/game_state.dart';
import 'package:rxdart/rxdart.dart';

class Controller {
  static const int rows = 20;
  static const int cols = 40;
  List<List<bool>> grid = List.generate(rows, (_) => List.filled(cols, false));
  final Random _random = Random();
  int _maxGenerations = 100;
  int _actualGeneration = 1;

  final _generations = BehaviorSubject<GameState>();
  Timer? _timer;

  IGameState get initialState => GameStateInitial(_maxGenerations, 0);
  Stream<GameState> get stream => _generations.stream;

  void start(int maxGenerations) {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
      update();
    });

    _maxGenerations = maxGenerations;
    _actualGeneration = 0;
    _initializeGrid();
    _generations.sink.add(GameState(grid, cols, rows,
        finalGeneration: _maxGenerations, actualGeneration: 1));
  }

  void update() {
    if (_actualGeneration >= _maxGenerations) {
      _generations.sink.add(GameStateFinish(grid, cols, rows,
          finalGeneration: _maxGenerations, actualGeneration: _actualGeneration));
      return;
    }
    _updateGrid();
    _actualGeneration++;
    _generations.sink.add(GameState(grid, cols, rows,
        finalGeneration: _maxGenerations, actualGeneration: _actualGeneration));
  }

  Future dispose() async {
    _timer?.cancel();
    await _generations.close();
  }

  void _initializeGrid() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        grid[i][j] = _random.nextBool();
      }
    }
  }

  void _updateGrid() {
    List<List<bool>> newGrid =
        List.generate(rows, (_) => List.filled(cols, false));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        int liveNeighbors = _countLiveNeighbors(i, j);

        if (grid[i][j]) {
          // Célula viva
          newGrid[i][j] = liveNeighbors == 2 || liveNeighbors == 3;
        } else {
          // Célula morta
          newGrid[i][j] = liveNeighbors == 3;
        }
      }
    }

    grid = newGrid;
  }

  int _countLiveNeighbors(int x, int y) {
    int count = 0;

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;

        int row = (x + i + rows) % rows;
        int col = (y + j + cols) % cols;

        if (grid[row][col]) count++;
      }
    }

    return count;
  }
}
