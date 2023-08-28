// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:bowling/logica/bowling_logic.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final BowlingLogic bowlingLogic = BowlingLogic();
  final logger = Logger();
  
  List<FrameScore> frameScores = List.generate(10,(index) => FrameScore(index + 1, -1, 0, -1, -1),);
  // List<int> valoresBotoes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BowlingApp'),
            SizedBox(width: 10),
            Icon(Icons.sports_golf),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
              ),
              Stack(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        criarContainersScore(context, 150, 300),
                        SizedBox(height: 30),
                        criarLinhaNumeros(context),
                        criarTabelaScore(context),
                        SizedBox(height: 20),
                        criarBotoesOpcoes(context),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

    Widget criarLinhaNumeros(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      height: MediaQuery.of(context).size.height * 0.048,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int frame = 1; frame <= 10; frame++)
            Container(
              width: MediaQuery.of(context).size.width * 0.915 / 10,
              height: MediaQuery.of(context).size.height * 0.08 / 2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                '$frame',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }


  Widget criarContainersScore(BuildContext context, int hdcpScore, int maxPossibleScore) {
  int hdcpScore = bowlingLogic.calculateHDCP(frameScores);
  
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 325,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 325,
              height: 58,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(
                'HDCP',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            ),
              Visibility(
                visible:hdcpScore != 9 ,
                child: Container(
                  width: 325,
                  height: 90,
                  alignment: Alignment.center,
                  child: Text(
                    hdcpScore.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ),
              ),
            ],
          ),
      ),
      SizedBox(width: 20),
      Container(
        width: 325,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 325,
              height: 58,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(
                'Max Possible',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            ),
            Container(
              width: 325,
              height: 90,
              alignment: Alignment.center,
              child: Text(
                maxPossibleScore.toString(),
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}




Widget criarTabelaScore(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.92,
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int frameIndex = 0; frameIndex < 10; frameIndex++)
              Container(
                width: MediaQuery.of(context).size.width * 0.9 / 10,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (frameIndex != 9)
                    Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.86 / 10) / 2,
                          height: MediaQuery.of(context).size.height * 0.16 / 2,
                          child: Center(
                            child: isEscolhaVisible(frameScores[frameIndex].value1)
                                  ? frameScores[frameIndex].value1 == 10 
                                        ? Text(
                                            '',
                                            style: TextStyle(fontSize: 26),
                                          )
                                        : Text(
                                            '${frameScores[frameIndex].value1}',
                                            style: TextStyle(fontSize: 26),
                                          )
                                    : Container(),
                          ),
                        ),

                        Container(
                          width: (MediaQuery.of(context).size.width * 0.9 / 10) / 2,
                          height: MediaQuery.of(context).size.height * 0.16 / 2,
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.black,
                                width: 2.3,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: isEscolhaVisible(frameScores[frameIndex].value1) && frameScores[frameIndex].value2 != -1
                                    ? frameScores[frameIndex].value1 == 10
                                        ? Text(
                                            'X',
                                            style: TextStyle(fontSize: 26),
                                          )
                                        : frameScores[frameIndex].value3 == 301 //  : frameScores[frameIndex].value1 + frameScores[frameIndex].value2 == 10 
                                            ? Text(
                                                '/',
                                                style: TextStyle(fontSize: 26),
                                              )
                                            : Text(
                                                '${frameScores[frameIndex].value2}',
                                                style: TextStyle(fontSize: 26),
                                              )
                                    : Container(),
                          ),
                        ),
                      ],
                    ),
                     if (frameIndex == 9)
                      Row(
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width * 0.6 / 10) / 2,
                            height: MediaQuery.of(context).size.height * 0.16 / 2,
                            child: Center(
                                child: isEscolhaVisible(frameScores[frameIndex].value1)
                                  ? Text('${frameScores[frameIndex].value1}',
                                      style: TextStyle(fontSize: 26),
                                    )
                                  : Container(), ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width * 0.9 / 10) / 3,
                            height: MediaQuery.of(context).size.height * 0.16 / 2,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.black,
                                  width: 2.3,
                                ),
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: Center(
                              child: isEscolhaVisible(frameScores[frameIndex].value1) &&
                                  frameScores[frameIndex].value2 != -1
                                  ? Text('${frameScores[frameIndex].value2}',
                                      style: TextStyle(fontSize: 26),
                                    )
                                  : Container(), ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width * 0.86 / 10) / 3,
                            height: MediaQuery.of(context).size.height * 0.16 / 2,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.black,
                                  width: 2.3,
                                ),
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Center(
                              child: isEscolhaVisible(frameScores[frameIndex].value1) &&
                                  frameScores[frameIndex].value2 != -1 &&
                                  frameScores[frameIndex].value4 != -1 
                                  //frameScores[frameIndex].value3 != -1
                                  ? Text('${frameScores[frameIndex].value4}',
                                      style: TextStyle(fontSize: 26),
                                    )
                                  : Container(), ),
                          ),
                        ],
                      ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.89 / 10,
                      height: MediaQuery.of(context).size.height * 0.14 / 2,
                      child: Center(
                        child: isEscolhaVisible(frameScores[frameIndex].value1) &&
                                  frameScores[frameIndex].value2 != -1 &&
                                  frameScores[frameIndex].value3 != -1 &&
                                  frameScores[frameIndex].value3 != 301
                                  ? Text('${frameScores[frameIndex].value3}', style: TextStyle(fontSize: 26),
                                    )
                                  : Container(),),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    ],
  );
}


Widget criarBotoesOpcoes(BuildContext context) {
  List<String> imagens = [
    'images/blueBall.png',
    'images/redBall.png',
    'images/purpleBall.png',
    'images/greenBall.png',
  ];

  bowlingLogic.updateButtonVisibility(); // Atualiza a visibilidade dos botões

  return Container(
    margin: EdgeInsets.only(right: 1200),
    width: MediaQuery.of(context).size.width * 0.3,
    height: MediaQuery.of(context).size.height * 0.38,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              //for (int row = 0; row < 1; row++)
              //for (int col = 0; col < 1; col++)
              Visibility(
                visible: !(bowlingLogic.jogadaValues.isNotEmpty &&
                    bowlingLogic.jogadaValues[0] != 0),
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      bowlingLogic.updateScores(frameScores, 2, 0);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage('images/Strikee.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
        ),
        for (int row = 0; row < 2; row++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int col = 0; col < 5; col++)
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: bowlingLogic.buttonsVisibility[row][col] // Usa a matriz para determinar a visibilidade
                          ? ElevatedButton(
                              onPressed: () {
                                bowlingLogic.updateScores(
                                    frameScores, row, col);
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image: AssetImage(imagens[
                                        (row * 5 + col) % imagens.length]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(top: 40),
                                  child: Text(
                                    '${row * 5 + col}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(), // Oculta o botão se não for visível
                    ),
                  ),
              ],
            ),
        ],
    ),
  );
}

bool isEscolhaVisible(int value) {
  return value > -1;
}

}
/*// Quando row é 0 e col é 0, o valor calculado será 1 (0 * 5 + 0 + 1).
  // Quando row é 0 e col é 1, o valor calculado será 2 (0 * 5 + 1 + 1).
  // -------------------------------------------------------------------
  // Quando row é 1 e col é 0, o valor calculado será 6 (1 * 5 + 0 + 1).
  // Quando row é 1 e col é 1, o valor calculado será 7 (1 * 5 + 1 + 1).*/ 