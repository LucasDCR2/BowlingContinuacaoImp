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
  List<List<bool>> buttonsVisibility = List.generate(2, (_) => List.filled(5, true)); 


  void updateScores(List<FrameScore> frameScores, int row, int col) {
    final buttonValue = row * 5 + col;

    // Verificar se o frame atual ainda está sendo preenchido
    if (i < frameScores.length) {
      buttonValues.add(buttonValue);

     
      if (buttonValues[0] == 10) {
        frameScores[i].value2 = 10;
        i++;
        buttonValues.clear();
      }

      frameScores[i].value1 = buttonValues.isNotEmpty ? buttonValues[0] : 0;
      frameScores[i].value2 = buttonValues.length > 1 ? buttonValues[1] : 0;

      if (buttonValues.length > 1) {
        frameScores[i].value3 = frameScores[i].value1 + frameScores[i].value2;

        if (frameScores[i].value3 == 10) {
            // armazenar em uma lista antes 
            frameScores[i].value3 = 0;
        }
          
          // E passar para o próximo frame
          i++;
          buttonValues.clear();
        
      } else {
        frameScores[i].value3 = 0;
      }
    }
    
    logger.d('Valores botões $buttonValues');
  }

void updateButtonVisibility() {
  int firstValor = buttonValues.isNotEmpty ? buttonValues[0] : 0;

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



