import 'package:flutter/material.dart';
import 'Questão.dart';
import 'Resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder; //declarando que essa variavel vai receber uma função por parametro 

  Questionario(
      {required this.perguntaSelecionada,
      required this.perguntas,
      required this.quandoResponder});

  bool get temPerguntaSelecionada {    //neste método ele retorna um valor booleano, então se a condição for verdadeira retorna true se não false
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['resposta']
            as List<Map<String, Object>>
        : [];

    return Column(children: <Widget>[
      Questao(perguntas[perguntaSelecionada]['texto'].toString()),
      ...respostas.map((resp) {
        return Resposta(resp['texto'].toString(),
            () => quandoResponder(int.parse(resp['pontuacao'].toString())));
      }).toList(),
    ]);
  }
}
