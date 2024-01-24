import 'package:flutter/material.dart';
import 'Resultado.dart';
import 'Questionario.dart';

main() => runApp(PerguntaAPP());

class PerguntaAppState extends State<PerguntaAPP> {
  var perguntaSelecionada = 0;  
  var pontuacaoTotal = 0;
  final List<Map<String, Object>> perguntas = const [  //Uma lista e dentro de cada nó sera armazenado um Map da chave do tipo String e valor do tipo Object
    {             
      'texto': "Qual sua cor favorita",
      'resposta': [
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},       //as chaves do tipo String são 'texto' e 'pontuação'
        {'texto': 'Amarelo', 'pontuacao': 1},    //e os Object que podem ser qualquer tipo de dado nos valores
      ],
    },
    {
      'texto': "Qual seu animal favorito",
      'resposta': [
        {'texto': 'Leão', 'pontuacao': 2},
        {'texto': 'Lobo', 'pontuacao': 4},
        {'texto': 'Gato', 'pontuacao': 8},
        {'texto': 'Canário', 'pontuacao': 9},
      ],
    },
    {
      'texto': "Qual seu time favorito",
      'resposta': [
        {'texto': 'Bahia', 'pontuacao': 1},
        {'texto': 'Santos', 'pontuacao': 3},
        {'texto': 'Fortaleza', 'pontuacao': 7},
        {'texto': 'Corinthians', 'pontuacao': 10},
      ]
    }
  ];

  void responder(int pontuacao) {  //método responder que recebe parametro pontuacao, então a cada ponto, vai acumulando na variavel pontuacaoTotal;
    setState(() {
      perguntaSelecionada++;
    });

    pontuacaoTotal += pontuacao;

    print(pontuacaoTotal);
  }

  void reiniciarQuestionario() {  //este método aqui quando chamado vai ser alterado as variaveis para 0 e automaticamente iniciara a pontuação;
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {   //neste método ele retorna um valor booleano, então se a condição for verdadeira retorna true se não false
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada     //então aqui enquanto o método retorna true exibe o widget questionario se for false mostrará widget Resultado 
            ? Questionario(
                perguntaSelecionada: perguntaSelecionada,
                perguntas: perguntas,
                quandoResponder: responder)
            : Resultado(pontuacaoTotal, reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaAPP extends StatefulWidget {
  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
