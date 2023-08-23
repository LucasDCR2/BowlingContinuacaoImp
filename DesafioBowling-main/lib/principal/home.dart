// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              padding: const EdgeInsets.all(50.0),
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
              for (int frame = 1; frame <= 10; frame++)
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
                      if (frame != 10)
                        Row(
                          children: [
                            SizedBox(
                              width: (MediaQuery.of(context).size.width *
                                      0.86 /
                                      10) /
                                  2,
                              height:
                                  MediaQuery.of(context).size.height * 0.16 / 2,
                              child: Center(),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width *
                                      0.9 /
                                      10) /
                                  2,
                              height:
                                  MediaQuery.of(context).size.height * 0.16 / 2,
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
                              child: Center(),
                            ),
                          ],
                        ),
                      if (frame == 10)
                        Row(
                          children: [
                            SizedBox(
                              width: (MediaQuery.of(context).size.width *
                                      0.6 /
                                      10) /
                                  2,
                              height:
                                  MediaQuery.of(context).size.height * 0.16 / 2,
                              child: Center(),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width *
                                      0.9 /
                                      10) /
                                  3,
                              height:
                                  MediaQuery.of(context).size.height * 0.16 / 2,
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
                              child: Center(),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width *
                                      0.86 /
                                      10) /
                                  3,
                              height:
                                  MediaQuery.of(context).size.height * 0.16 / 2,
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
                              child: Center(),
                            ),
                          ],
                        ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.89 / 10,
                        height: MediaQuery.of(context).size.height * 0.14 / 2,
                        child: Center(),
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
                  'Container 1.2',
                  style: TextStyle(color: Colors.white),
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
                  'Container 2.2',
                  style: TextStyle(color: Colors.white),
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
    width: MediaQuery.of(context).size.width * 1.2,
    height: MediaQuery.of(context).size.height * 0.3,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                        int frame = row * 5 + col + 1;
                        logger.d('Botão $frame pressionado');
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
                        child: Text(
                          '${row * 5 + col + 1}',
                          style: TextStyle(color: Colors.white),
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
