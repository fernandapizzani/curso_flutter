import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado{
    if(pontuacao< 8){
      return 'Não me conhece tanto assim';
    }else if(pontuacao < 15){
      return 'Da pra melhorar';
    }else if(pontuacao < 25){
      return 'Caraca você me conhece bem';
    }else {
      return 'Você realmente me conhece!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
              child: Text(fraseResultado,
              style: TextStyle( fontSize: 28),
              ),
            ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text('Reiniciar'),
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 18),
            backgroundColor: Colors.deepPurple[200],
            foregroundColor: Colors.deepPurple[700],
            side: BorderSide(color: Colors.deepPurple.shade800, width:2),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
        )
      ],
    );
  }
}