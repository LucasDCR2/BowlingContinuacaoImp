import 'package:logger/logger.dart';

class FrameScore {
  int frameNumber;
  int value1 = 0;
  int value2 = 0;
  int value3 = 0;
  int value4 = 0; // Apenas para o último frame

  FrameScore(this.frameNumber, this.value1, this.value2, this.value3, this.value4);
}

class BowlingLogic {
  final Logger logger = Logger();
  List<int> buttonValues = [];
  int clickAtual = 0;

  void updateScores(List<FrameScore> frameScores, int row, int col) {
    final buttonValue = 1 + row * 5 + col;
    buttonValues.add(buttonValue);

    for (var i = 0; i < frameScores.length; i++) {
      if (clickAtual == 0) {
        frameScores[0].value1 = buttonValues.isNotEmpty ? buttonValues[0] : 0;
        frameScores[0].value2 = buttonValues.length > 1 ? buttonValues[1] : 0;

        if (buttonValues.length > 1) {
          frameScores[0].value3 = frameScores[0].value1 + frameScores[0].value2;
        } else {
          frameScores[0].value3 = 0;
        }
      }
    }

    logger.d('Valores botões $buttonValues');
  }
}
