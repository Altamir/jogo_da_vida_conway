import 'package:flutter/material.dart';

class JogoDaVidaWidget extends StatelessWidget {
  const JogoDaVidaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'O Jogo da Vida de Conway',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'O jogo se desenrola em uma grade infinita de células, cada uma podendo estar "viva" ou "morta". A cada geração (passo de tempo), o estado de cada célula é atualizado com base no estado de suas oito células vizinhas, seguindo estas regras:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          _Rule(
            title: '1. Superpopulação:',
            description:
                'Uma célula viva com mais de três vizinhos vivos morre.',
          ),
          _Rule(
            title: '2. Isolamento:',
            description:
                'Uma célula viva com menos de dois vizinhos vivos morre.',
          ),
          _Rule(
            title: '3. Nascimento:',
            description:
                'Uma célula morta com exatamente três vizinhos vivos se torna viva.',
          ),
          _Rule(
            title: '4. Sobrevivência:',
            description:
                'Uma célula viva com dois ou três vizinhos vivos permanece viva.',
          ),
          SizedBox(height: 20),
          Text(
            'Gerações:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'O jogo se desenrola em gerações discretas. A cada geração, todas as células são atualizadas simultaneamente de acordo com as regras acima. A configuração inicial de células vivas e mortas determina como o sistema evoluirá ao longo das gerações. Alguns padrões desaparecem rapidamente, outros se estabilizam, alguns oscilam entre estados, e outros se movem pela grade, criando um espetáculo dinâmico e imprevisível.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Observações:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          _Observation(
              '* O Jogo da Vida é um autômato celular, um modelo matemático que estuda sistemas complexos a partir de interações locais simples.'),
          _Observation(
              '* Ele não tem um objetivo específico ou um jogador. O interesse está em observar os padrões que emergem e como eles evoluem.'),
          _Observation(
              '* Existem inúmeros padrões conhecidos, como o "Glider", que se move pela grade, e o "R-pentomino", que gera um caos complexo antes de se estabilizar.'),
          _Observation(
              '* O Jogo da Vida tem aplicações em diversas áreas, como biologia, física, ciência da computação e até filosofia, levantando questões sobre a natureza da vida e da complexidade.'),
        ],
      ),
    );
  }

  Widget _buildRule(String title, String description) {
    return _Rule(
      title: title,
      description: description,
    );
  }
}

class _Rule extends StatelessWidget {
  final String title;
  final String description;

  const _Rule({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: ' $description',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class _Observation extends StatelessWidget {
  final String text;

  const _Observation(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
