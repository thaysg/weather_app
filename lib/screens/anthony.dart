import 'package:flutter/material.dart';
import 'dart:math';

class Anthony extends StatefulWidget {
  @override
  _AnthonyState createState() => _AnthonyState();
}

class _AnthonyState extends State<Anthony> {
  List<String> frase = [
    'Não tenha medo da mudança. Coisas boas se vão para que melhores possam vir.',
    'Vencedor não é aquele que sempre vence, mas sim aquele que nunca para de lutar.',
    'Nunca diga eu não consigo. Você consegue sim, basta ter força de vontade e fé.'
  ];

  @override
  Widget build(BuildContext context) {
    var numm = Random().nextInt(frase.length);
    return Scaffold(
      body: Center(
        child: Text(
          frase[numm],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.amber,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
