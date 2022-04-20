import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJokenpo extends StatefulWidget {
  const HJokenpo({Key? key}) : super(key: key);

  @override
  State<HJokenpo> createState() => _HJokenpoState();
}

class _HJokenpoState extends State<HJokenpo> {
  var _imgApp = Image.asset('images/padrao.png');
  var _mensagem = 'Escolha sua Opção';

  void _joga(String opcaoJogador) {
    final lista_opcoes = ['pedra', 'papel', 'tesoura'];
    final opcaoApp = lista_opcoes[Random().nextInt(3)];

    setState(() {
      _imgApp = Image.asset('images/$opcaoApp.png');
      _mensagem = _resultado(opcaoJogador, opcaoApp);
    });
  }

  String _resultado(String opcaoJogador, String opcaoApp) {
    final mensagem;

    if ((opcaoJogador == 'pedra' && opcaoApp == 'tesoura') ||
        (opcaoJogador == 'papel' && opcaoApp == 'pedra') ||
        (opcaoJogador == 'tesoura' && opcaoApp == 'papel')) {
      mensagem = 'Você Ganhou!!!';
    } else if ((opcaoJogador == 'pedra' && opcaoApp == 'pedra') ||
        (opcaoJogador == 'papel' && opcaoApp == 'papel') ||
        (opcaoJogador == 'tesoura' && opcaoApp == 'tesoura')) {
      mensagem = 'Empatamos!!!!';
    } else {
      mensagem = 'Você Perdeu!!!';
    }

    return mensagem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokenpo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textWithPadding('Escolha do App'),
          _imgApp,
          textWithPadding(_mensagem),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              playerImages('tesoura'),
              playerImages('pedra'),
              playerImages('papel'),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector playerImages(String image) {
    return GestureDetector(
      onTap: () => _joga(image),
      child: Image.asset(
        'images/$image.png',
        height: 100,
      ),
    );
  }

  Padding textWithPadding(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 16,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
