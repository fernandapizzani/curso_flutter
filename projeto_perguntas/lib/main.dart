import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';


main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a minha cor favorita?',
      'respostas': [
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Roxo', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 8},
        {'texto': 'Amarelo', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual é o meu animal favorito?',
      'respostas': [
       {'texto': 'Borboleta', 'pontuacao' : 10},
       {'texto': 'Gato', 'pontuacao' : 1},
       {'texto': 'Minhoca', 'pontuacao' : 3},
       {'texto': 'Tigre', 'pontuacao' : 5},
        ],
    },
    {
      'texto': 'Qual é o meu cantor favorito?',
      'respostas': [
       {'texto' : 'Olivia Rodrigo', 'pontuacao': 10},
       {'texto' : 'Chappel Roan', 'pontuacao': 1}, 
       {'texto' : 'Taylor Swift', 'pontuacao': 8}, 
       {'texto' : 'Billie eiliesh', 'pontuacao': 7},
        ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body:
            temPerguntaSelecionada
                ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder,
                )
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
