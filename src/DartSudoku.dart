#import('dart:html');

class SudokuCell {
  num digit;
  bool fixed;
  bool get empty() => (digit == 0);
  SudokuCell(this.digit, this.fixed);
}

class SudokuBoard {
  List<List<SudokuCell>> _board;
  
  SudokuBoard() {
    _board = new List<List<SudokuCell>>();
    for (var row = 0; row < 9; row++) {
      _board.add(new List<SudokuCell>());
      for (var col = 0; col < 9; col++) {
        _board[row].add(new SudokuCell(0, false));
      }
    }
  }
  
  SudokuCell cell(num row, num col) => _board[row][col];
}

class DartSudoku {

  SudokuBoard _board;
  
  DartSudoku() {
    _board = new SudokuBoard();
  }

  void run() {
    write("DartSudoku started!");
    _board.cell(5, 3).digit = 7;
    _board.cell(5, 3).fixed = true;
    _board.cell(7, 2).digit = 4;
    _board.cell(7, 2).fixed = false;
    drawBoard();
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
  
  void drawBoard() {
    var boardHtml = "<table border='1'>";
    for (var row = 0; row < 9; row++) {
      boardHtml += "<tr>";
      for (var col = 0; col < 9; col++) {
        var str = _board.cell(row, col).fixed ? "[" : "&nbsp;";
        str += _board.cell(row, col).empty ? "&nbsp;" : _board.cell(row, col).digit.toString();
        str += _board.cell(row, col).fixed ? "]" : "&nbsp;";
        boardHtml += "<td>" + str + "</td>";
      }
      boardHtml += "</tr>";
    }
    document.query('#board').innerHTML = boardHtml;
  }
}

void main() {
  new DartSudoku().run();
}
