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
  int i = 0;


  void updateScores(List<FrameScore> frameScores, int row, int col) {
    final buttonValue = row * 5 + col;

    // Verificar se o frame atual ainda está sendo preenchido
    if (i < frameScores.length) {
      buttonValues.add(buttonValue);

      // Preencher os valores do frame atual
      frameScores[i].value1 = buttonValues.isNotEmpty ? buttonValues[0] : 0;
      frameScores[i].value2 = buttonValues.length > 1 ? buttonValues[1] : 0;

      if (buttonValues.length > 1) {
        frameScores[i].value3 = frameScores[i].value1 + frameScores[i].value2;

        if (frameScores[i].value3 != 1000) {
          // Desabilitar botões relacionados ao frame currentFrame
          // E passar para o próximo frame
          i++;
          buttonValues.clear();
        }
      } else {
        frameScores[i].value3 = 0;
      }
    }

    logger.d('Valores botões $buttonValues');
  }
}

