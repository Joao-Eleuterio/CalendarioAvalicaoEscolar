import 'package:flutter/material.dart';
import 'package:miniprojeto/models/avaliacao.dart';


class AvaliacaoGeral {
  final List<Avaliacao> _avaliacoes = [];

  void addAvaliacao(Avaliacao avaliacao) {
    _avaliacoes.add(avaliacao);
  }


  //Nível médio de dificuldade das avaliações dos próximos 7 dias;
  //Nível médio de dificuldade das avaliações entre os 7 e os 14 dias (futuro);
  double nivelProximosDias(int val1, int val2) {
   double media = 0;
   int quantos = 0;

   for (int i = 0; i < _avaliacoes.length; i++) {
    if (_avaliacoes[i].getData().compareTo(DateTime.now().add(Duration(days: val1))) >= 0 &&
        _avaliacoes[i].getData().compareTo(
            DateTime.now().add(Duration(days: val2))) < 0) {
     quantos++;
     media += _avaliacoes[i].getNivelDificuldade();
    }
   }
   return  quantos==0? 0 : double.parse((media/=quantos).toStringAsFixed(2));
  }

  /*List<Card> cards() {
     int pont=0;
     List<Card> card =[];
     //organizar por data
     _avaliacoes.sort((a, b) => a.getData().compareTo(b.getData()));
     //ve o primeiro dia
    DateTime data = _avaliacoes[0].getData();
    for (int i = 0; i < _avaliacoes.length; i++) {
      //ve se esta entre hoje e daqui a 7 dias
      if ((_avaliacoes[i].getData()).compareTo(DateTime.now()) > 0
          && _avaliacoes[i].getData().compareTo(DateTime.now().add(const Duration(days: 7))) < 0) {
        //ve se mudou de dia
        if(data.weekday.compareTo(_avaliacoes[i].getData().weekday)<0){
          //se sim muda o dia da data
          data = _avaliacoes[i].getData();
          //se a lista não estiver vazia muda de cor
          if(card.isNotEmpty) {
            pont++;
          }
        }

        card.add(Card(color: pont == 0 ? Colors.deepOrange : pont == 1
            ? Colors.blueGrey
            : Colors.grey[350],
          child: Container(
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Image.asset('lib/assets/logo.jpg'),
              title: Text(_avaliacoes[i].escreve(true)),
            ),
          ),
        ));
      }
    }
      return card;
  }*/

  void removerAvaliacao(int index){
    _avaliacoes.removeAt(index);
  }
 List getAllAssessments() => _avaliacoes;

  void SendMensage(mensagem,context, {cor = Colors.green}) {
    var snackBar = SnackBar(
      content: Text(
        mensagem,
        style: const TextStyle(fontSize: 20),
      ),
      backgroundColor: cor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget dashCards(BuildContext context, int index) {
      if(_avaliacoes[index].getData().compareTo(DateTime.now())>=0
          && _avaliacoes[index].getData().compareTo(DateTime.now().add(const Duration(days: 7)))<=0) {
        final cor =  _avaliacoes[index].getCorCard();
       return Card(color: cor,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              leading: cor==Colors.deepOrange ? const Icon(Icons.looks_one,size: 50):
              cor==Colors.blueGrey? const Icon(Icons.looks_two,size: 50): const Icon(Icons.looks_3,size: 50),//Image.asset('lib/assets/logo.jpg') ,
              title: Text(_avaliacoes[index].escreve(true)),
            ),
          ),
        );

      }return const Card();
  }

}
