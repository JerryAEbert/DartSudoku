#import('dart:html');

class DartSudoku {

  DartSudoku() {
  }

  void run() {
    write("DartSudoku started!");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new DartSudoku().run();
}
