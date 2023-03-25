import 'package:flutter/material.dart';

class Avaliacao {
  String _nomeDisciplina = "";
  String _tipoAvaliacao = 'Frequência';
  DateTime _dataHora = DateTime(2020, 01, 01, 0, 0);
  int  _nivelDificuldade = 0;
  String _observacao = "";




  Avaliacao(nome, tipo, data, nivel, observ) {
    _nomeDisciplina = nome;
    _tipoAvaliacao = tipo;
    _dataHora = data;
    _nivelDificuldade = nivel;
    _observacao = observ;
  }

  //Getter
  DateTime getData() =>_dataHora;
  String getNomeDisciplina()=> _nomeDisciplina;
  String getTipoAvaliacao() => _tipoAvaliacao;
  int getNivelDificuldade() => _nivelDificuldade;
  String getObservacao() => _observacao;

  //Setter
  DateTime setData(data) =>_dataHora=data;
  String setNomeDisciplina(nome)=> _nomeDisciplina=nome;
  String setTipoAvaliacao(tipo) => _tipoAvaliacao=tipo;
  int setNivelDificuldade(nivel) => _nivelDificuldade=nivel;
  String setObservacao(obs) => _observacao=obs;


  @override
  String toString() {
    return 'Avaliacao{_nomeDisciplina: $_nomeDisciplina, _tipoAvaliacao: $_tipoAvaliacao, _dataHora: $_dataHora, _nivelDificuldade: $_nivelDificuldade, _observacao: $_observacao}';
  }

  String formatoData(DateTime data){
    return "${data.toString().replaceAll("-", "/").split(":")[0]}:${data.toString().split(":")[1]}";
  }
  String escreve(listagem) {
    String tString = "";
    if (!listagem) {
      tString = "Nome da disciplina: $_nomeDisciplina\n"
          "Tipo de avaliação: $_tipoAvaliacao\n"
          "Data: ${formatoData(_dataHora)}\n"
          "Nivel Dificuldade: $_nivelDificuldade\n";
      tString += _observacao != "" ? "Observação: $_observacao" : "";
    } else {
      tString = "Nome da disciplina: $_nomeDisciplina\n"
          "Tipo de avaliação: $_tipoAvaliacao\n"
          "Data: ${formatoData(_dataHora)}\n"
          "Nivel Dificuldade: $_nivelDificuldade\n";
    }
    return tString;
  }

  String messagemDealer() {

    String mensagem = "Mensagem do Dealer!!"
    "\n\nVamos ter avaliação de ${getNomeDisciplina()},"
        " em ${formatoData(_dataHora)},"
        " com a dificuldade de ${getNivelDificuldade()} numa escala de 1 a 5."
        "\n\nObservações para esta avaliação:\n${getObservacao()}";

    return mensagem;
  }
  Color getCorCard(){
    late Color corFinal =Colors.blueAccent;

      if(_dataHora.weekday== DateTime.now().weekday && _dataHora.compareTo(DateTime.now().add(const Duration(days: 1)))<0){
        corFinal = Colors.deepOrange;
      }else if((_dataHora.weekday.compareTo(DateTime.now().weekday+1) <= 0 && _dataHora.compareTo(DateTime.now().add(const Duration(days: 1))) <=0) || (((DateTime.now().weekday == 5)
          || (DateTime.now().weekday == 6)) && (_dataHora.weekday == 1))) {
        corFinal = Colors.blueGrey;
      } else if(_dataHora.compareTo(DateTime.now().add(const Duration(days: 1)))>0 && _dataHora.weekday.compareTo(DateTime.now().weekday  + 7) <= 0){
        corFinal = Colors.grey[350]!;
      }

    return corFinal;
  }
}
