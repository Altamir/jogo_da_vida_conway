import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const SelectableText(
            'O Jogo da Vida de Conway é um fascinante "jogo de zero jogadores" que simula a evolução de padrões em uma grade, seguindo regras simples. Apesar de sua simplicidade, ele gera uma complexidade surpreendente, com padrões que emergem, se movem, interagem e até se replicam. É um exemplo clássico de como regras básicas podem levar a comportamentos complexos e imprevisíveis.',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),);
  }
}
