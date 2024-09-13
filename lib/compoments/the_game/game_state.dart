abstract class IGameState{
  bool isAlive(int index) => true;
}

class GameStateInitial extends IGameState {
  final int finalGeneration;
  final int actualGeneration;

  GameStateInitial(this.finalGeneration, this.actualGeneration);

  @override
  bool isAlive(int index) => false;
}

class GameState extends IGameState {
  final int finalGeneration;
  final int actualGeneration;
  final List<List<bool>> _grid;
  final int _cols;
  final int _rows;

  GameState(
    this._grid, this._cols, this._rows, {
    required this.finalGeneration,
    required this.actualGeneration,
  });

  @override
  bool isAlive(int index){
    int row = index ~/ _cols;
    int col = index % _cols;
    bool isAlive = _grid[row][col];
    return isAlive;
  }
}

class GameStateFinish extends GameState {
  GameStateFinish(super.grid, super.cols, super.rows, {required super.finalGeneration, required super.actualGeneration});
}


