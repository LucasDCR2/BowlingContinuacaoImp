import 'package:logger/logger.dart';

class FrameScore {
  int frameNumber;
  int value1 = 0;
  int value2 = 0;
  int value3 = 0;
  int value4 = 0; // Apenas para o último frame

  FrameScore(
      this.frameNumber, this.value1, this.value2, this.value3, this.value4);
}

class BowlingLogic {
  final Logger logger = Logger();
  int i = 0;
  List<int> jogadaValues = [];
  List<int> valorTotal = [];
  List<List<bool>> buttonsVisibility =
      List.generate(2, (_) => List.filled(5, true));

  void updateScores(List<FrameScore> frameScores, int row, int col) {
    final buttonValue = row * 5 + col;

    // Verificar se o frame atual ainda está sendo preenchido
    if (i < frameScores.length - 1) {
      jogadaValues.add(buttonValue);
      valorTotal.add(buttonValue);

      // STRIKE
      if (jogadaValues[0] == 10) {
        frameScores[i].value1 = 10;
        frameScores[i].value2 = 10;
        frameScores[i].value3 = -1;
        i++;
        jogadaValues.clear();
      }

      frameScores[i].value1 = jogadaValues.isNotEmpty ? jogadaValues[0] : -1;
      frameScores[i].value2 = jogadaValues.length > 1 ? jogadaValues[1] : -1;

      if (jogadaValues.length > 1) {
        frameScores[i].value3 = calculateHDCP(frameScores);

        // SPARE
        if (frameScores[i].value1 + frameScores[i].value2 == 10) {
          frameScores[i].value3 = 10;
        }

        i++;
        jogadaValues.clear();
      } else {
        frameScores[i].value3 = 0;
      }
    } else {
      
      jogadaValues.add(buttonValue);
      valorTotal.add(buttonValue);

      // STRIKE

      frameScores[i].value1 = jogadaValues.isNotEmpty ? jogadaValues[0] : -1;
      frameScores[i].value2 = jogadaValues.length > 1 ? jogadaValues[1] : -1;
      frameScores[i].value4 = jogadaValues.length > 2 ? jogadaValues[2] : -1;

      if (jogadaValues.length > 2) {
        frameScores[i].value3 = frameScores[i].value3 = calculateHDCP(frameScores);
        
        // SPARE
        

        i++;
        jogadaValues.clear();
      } else {
        frameScores[i].value3 = 10;
      }
    }

    logger.d('Valor total $valorTotal');
  }

  void updateButtonVisibility() {
    int firstValor = jogadaValues.isNotEmpty ? jogadaValues[0] : 0;

    for (int row = 0; row < 2; row++) {
      for (int col = 0; col < 5; col++) {
        int botaoID = row * 5 + col;
        bool isVisible = true;

        switch (firstValor) {
          case 1:
            if (botaoID >= 10) {
              isVisible = false;
            }
            break;
          case 2:
            if (botaoID >= 9) {
              isVisible = false;
            }
            break;
          case 3:
            if (botaoID >= 8) {
              isVisible = false;
            }
            break;
          case 4:
            if (botaoID >= 7) {
              isVisible = false;
            }
            break;
          case 5:
            if (botaoID >= 6) {
              isVisible = false;
            }
            break;
          case 6:
            if (botaoID >= 5) {
              isVisible = false;
            }
            break;
          case 7:
            if (botaoID >= 4) {
              isVisible = false;
            }
            break;
          case 8:
            if (botaoID >= 3) {
              isVisible = false;
            }
            break;
          case 9:
            if (botaoID >= 2) {
              isVisible = false;
            }
            break;
        }

        buttonsVisibility[row][col] = isVisible;
      }
    }
  }

    int calculateHDCP(List<FrameScore> frameScores) {
    int hdcp = 0;
    for (int i = 0; i < valorTotal.length; i++) {
      hdcp  += valorTotal[i];

      if (i < frameScores.length - 1) {
        if (frameScores[i].value1 + frameScores[i].value2 == 10) {
          hdcp += frameScores[i + 1].value1;
        }
      }
    }
    logger.d('Valor HDCP $hdcp');
    return hdcp;
  }
}




/*
final buttonValue = row * 5 + col;
List<int> buttonValues = [];
  se buttonValues[0] = 0 - todos botoes devem estar visiveis 
  se buttonValues[0] = 1 - os buttonValue = 10 devem ficar invisiveis
  se buttonValues[0] = 2 - os buttonValue = 10 e 9 devem ficar invisiveis
  se buttonValues[0] = 3 - os buttonValue = 10, 9, 8 devem ficar invisiveis
  se buttonValues[0] = 4 - os buttonValue = 10, 9, 8, 7 devem ficar invisiveis 
  se buttonValues[0] = 5 - os buttonValue = 10, 9, 8, 7, 6  devem ficar invisiveis 
  se buttonValues[0] = 6 - os buttonValue = 10, 9, 8, 7, 6, 5  devem ficar invisiveis 
  se buttonValues[0] = 7 - os buttonValue = 10, 9, 8, 7, 6, 5, 4,   devem ficar invisiveis
  se buttonValues[0] = 8 - os buttonValue = 10, 9, 8, 7, 6, 5, 4, 3   devem ficar invisiveis 
  se buttonValues[0] = 9 - os buttonValue = 10, 9, 8, 7, 6, 5, 4, 3, 2  devem ficar invisiveis
  se buttonValues[0] = 10 - todos botoes devem estar invisiveis 
*/



