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

  List<FrameScore> frameScores = List.generate(10,(index) => FrameScore(index + 1, 0, 0, 0, 0),);
  int buttonValue = 0;
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Bem-vindo ao Aplicativo de Boliche!',
                style: TextStyle(fontSize: 28),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      criarContainersScore(context),
                      SizedBox(height: 30),
                      criarLinhaNumeros(context),
                      criarTabelaScore(context),
                      SizedBox(height: 50),
                      criarBotoesOpcoes(context)
                    ],
                  ),
                ),
              ],
            ),
          ],
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


  Widget criarContainersScore(BuildContext context) {
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
                  'HDCP Score',
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
              Container(
                width: 325,
                height: 90,
                alignment: Alignment.center,
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white,
                  fontSize: 26),
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
                  '300',
                  style: TextStyle(color: Colors.white,
                  fontSize: 26),
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
                            child: Text('${frameScores[frameIndex].value1}',style: TextStyle(fontSize: 26),
                            ),
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
                            child: Text('${frameScores[frameIndex].value2}', style: TextStyle(fontSize: 26),
                            ),
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
                            child: Center(child: Text('${frameScores[frameIndex].value1}',style: TextStyle(fontSize: 26),),),
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
                            child: Center(child: Text('${frameScores[frameIndex].value2}',style: TextStyle(fontSize: 26),),),
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
                            child: Center(child: Text('${frameScores[frameIndex].value4}',style: TextStyle(fontSize: 26),),),
                          ),
                        ],
                      ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.89 / 10,
                      height: MediaQuery.of(context).size.height * 0.14 / 2,
                      child: Center(child: Text('${frameScores[frameIndex].value3}',style: TextStyle(fontSize: 26),),),
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

  
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 80),
    width: MediaQuery.of(context).size.width * 1.0,
    height: MediaQuery.of(context).size.height * 0.35,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 200),
              width: 100,
              height: 100,
              child: ElevatedButton(
              onPressed: () {
                // Lógica para o novo botão
              },
              child: Text('Novo Botão'),
            ),
            )
          ],
        ),
      
        for (int row = 0; row < 2; row++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int col = 0; col < 5; col++)
                SizedBox(
                  width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),

                      child: ElevatedButton(
                        onPressed: () {                        
                          bowlingLogic.updateScores(frameScores, row, col);
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
                            image: AssetImage(imagens[(row * 5 + col) % imagens.length]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 40),     
                          child: Text(                              // Quando row é 0 e col é 0, o valor calculado será 1 (0 * 5 + 0 + 1).
                            '${1 + row * 5 + col}',                 // Quando row é 0 e col é 1, o valor calculado será 2 (0 * 5 + 1 + 1).
                            style: TextStyle(                       // -------------------------------------------------------------------
                              color: Colors.white,                // Quando row é 1 e col é 0, o valor calculado será 6 (1 * 5 + 0 + 1).
                              fontSize: 30,                         // Quando row é 1 e col é 1, o valor calculado será 7 (1 * 5 + 1 + 1).
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    ),
  );
}


}
/*// Quando row é 0 e col é 0, o valor calculado será 1 (0 * 5 + 0 + 1).
  // Quando row é 0 e col é 1, o valor calculado será 2 (0 * 5 + 1 + 1).
  // -------------------------------------------------------------------
  // Quando row é 1 e col é 0, o valor calculado será 6 (1 * 5 + 0 + 1).
  // Quando row é 1 e col é 1, o valor calculado será 7 (1 * 5 + 1 + 1).*/ 