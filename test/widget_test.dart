// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:miniprojeto/models/avaliacao.dart';
import 'package:miniprojeto/models/avaliacoesGerais.dart';

void main() {
  //Avaliacao
  test("Construtor inicializar avaliacao válida", () {
    final avaliacao = Avaliacao(
        "Computação Móvel", "Projeto", DateTime(2023, 03, 03, 18, 10), 5, "");
    expect(avaliacao.getTipoAvaliacao(), "Projeto");
    expect(avaliacao.getNomeDisciplina(), "Computação Móvel");
    expect(avaliacao.getData(), DateTime(2023, 03, 03, 18, 10));
    expect(avaliacao.getNivelDificuldade(), 5);
    expect(avaliacao.getObservacao(), "");
  });
  test("Texto no Card da listagem", () {
    final avaliacao = Avaliacao(
        "Computação Móvel", "Projeto", DateTime(2023, 03, 03, 18, 10), 5, "");
    expect(
        avaliacao.escreve(true),
        "Nome da disciplina: Computação Móvel\n"
        "Tipo de avaliação: Projeto\n"
        "Data: 2023/03/03 18:10\n"
        "Nivel Dificuldade: 5\n");

    final avaliacao2 = Avaliacao("Computação Móvel", "Projeto",
        DateTime(2023, 03, 03, 18, 10), 5, "Muito complicado");
    expect(
        avaliacao2.escreve(true),
        "Nome da disciplina: Computação Móvel\n"
        "Tipo de avaliação: Projeto\n"
        "Data: 2023/03/03 18:10\n"
        "Nivel Dificuldade: 5\n");
  });
  test("Texto no Card da consulta", () {
    final avaliacao = Avaliacao(
        "Computação Móvel", "Projeto", DateTime(2023, 03, 03, 18, 10), 5, "");
    expect(
        avaliacao.escreve(false),
        "Nome da disciplina: Computação Móvel\n"
        "Tipo de avaliação: Projeto\n"
        "Data: 2023/03/03 18:10\n"
        "Nivel Dificuldade: 5\n");

    final avaliacao2 = Avaliacao("Computação Móvel", "Projeto",
        DateTime(2023, 03, 03, 18, 10), 5, "Muito complicado");
    expect(
        avaliacao2.escreve(false),
        "Nome da disciplina: Computação Móvel\n"
        "Tipo de avaliação: Projeto\n"
        "Data: 2023/03/03 18:10\n"
        "Nivel Dificuldade: 5\n"
        "Observação: Muito complicado");
  });
  test("Mudar items Avaliacao", () {
    final avaliacao = Avaliacao(
        "Computação Móvel", "Projeto", DateTime(2023, 03, 03, 18, 10), 5, "");
    avaliacao.setNomeDisciplina("CM");
    avaliacao.setTipoAvaliacao("Frequência");
    avaliacao.setData(DateTime(2023, 05, 05, 19, 11));
    avaliacao.setNivelDificuldade(2);
    avaliacao.setObservacao("Esta cadeira e dificil");
    expect(avaliacao.getNomeDisciplina(), "CM");
    expect(avaliacao.getTipoAvaliacao(), "Frequência");
    expect(avaliacao.getData(), DateTime(2023, 05, 05, 19, 11));
    expect(avaliacao.getNivelDificuldade(), 2);
    expect(avaliacao.getObservacao(), "Esta cadeira e dificil");
  });
  test("Cor Card DashBoard", () {
    AvaliacaoGeral avaliacaoGeral = avaliacoes();
    for (int i = 0; i < avaliacaoGeral.getAllAssessments().length; i++) {
      switch (i) {
        case 0:
          //Data anterior
          expect(
              avaliacaoGeral
                  .getAllAssessments()[0]
                  .getCorCard()
                  .toString()
                  .split('(0x')[1]
                  .split(')')[0],
              'ff448aff');
          break;
        case 1:
        //Data hoje
          expect(
              avaliacaoGeral
                  .getAllAssessments()[1]
                  .getCorCard()
                  .toString()
                  .split('(0x')[1]
                  .split(')')[0],
              'ffff5722');
          break;
        case 2:
        //Data amanha
          expect(
              avaliacaoGeral
                  .getAllAssessments()[2]
                  .getCorCard()
                  .toString()
                  .split('(0x')[1]
                  .split(')')[0],
              'ff607d8b');
          break;
        case 3://Data outros dias
          expect(
              avaliacaoGeral
                  .getAllAssessments()[3]
                  .getCorCard()
                  .toString()
                  .split('(0x')[1]
                  .split(')')[0],
              'ffd6d6d6');
          break;

        case 4://Data outros dias
          expect(
              avaliacaoGeral
                  .getAllAssessments()[4]
                  .getCorCard()
                  .toString()
                  .split('(0x')[1]
                  .split(')')[0],
              'ffd6d6d6');
          break;
        case 5:
        //Data outros dias
          expect(
              avaliacaoGeral
                  .getAllAssessments()[5]
                  .getCorCard()
                  .toString()
                  .split('(0x')[1]
                  .split(')')[0],
              'ffd6d6d6');
          break;
        case 6:
        //Data outros dias
          expect(
              avaliacaoGeral
                  .getAllAssessments()[6]
                  .getCorCard()
                  .toString()
                  .split('(0x')[1]
                  .split(')')[0],
              'ffd6d6d6');
          break;
        case 7:
        //Data outros dias
          expect(
              avaliacaoGeral
                  .getAllAssessments()[7]
                  .getCorCard()
                  .toString()
                  .split('(0x')[1]
                  .split(')')[0],
              'ffd6d6d6');
          break;
        case 8:
        //Data outros dias
          expect(
              avaliacaoGeral
                  .getAllAssessments()[8]
                  .getCorCard()
                  .toString()
                  .split('(0x')[1]
                  .split(')')[0],
              'ffd6d6d6');
          break;
      }
    }
  });

  //AvaliacaoGeral
  test("Adiciona Avaliacao", () {
    //Teste com uma avaliacao
    final avaliacao = Avaliacao(
        "Computação Móvel", "Projeto", DateTime(2023, 03, 03, 18, 10), 5, "");
    AvaliacaoGeral avaliacaoGeral = AvaliacaoGeral();
    avaliacaoGeral.addAvaliacao(avaliacao);
    expect(avaliacaoGeral.getAllAssessments()[0].toString(),
        'Avaliacao{_nomeDisciplina: Computação Móvel, _tipoAvaliacao: Projeto, _dataHora: 2023-03-03 18:10:00.000, _nivelDificuldade: 5, _observacao: }');
    //Teste com duas avaliacoes
    final avaliacao2 = Avaliacao("CM", "Frequência",
        DateTime(2023, 03, 03, 18, 10), 5, "Sou a segunda avaliacao");
    avaliacaoGeral.addAvaliacao(avaliacao2);
    expect(avaliacaoGeral.getAllAssessments()[1].toString(),
        'Avaliacao{_nomeDisciplina: CM, _tipoAvaliacao: Frequência, _dataHora: 2023-03-03 18:10:00.000, _nivelDificuldade: 5, _observacao: Sou a segunda avaliacao}');
  });
  test("Eliminar Avaliacoes e obter o tamanho da lista", () {
    final avaliacao = Avaliacao(
        "avaliacao", "Mini-Teste", DateTime(2022, 03, 03, 18, 10), 5, "");
    final avaliacao1 = Avaliacao("avaliacao1", "Projeto",
        DateTime.now().add(const Duration(hours: 2)), 5, "");
    final avaliacao2 = Avaliacao("avaliacao2", "Frequência",
        DateTime.now().add(const Duration(days: 2)), 5, "");
    AvaliacaoGeral avaliacaoGeral = AvaliacaoGeral();
    avaliacaoGeral.addAvaliacao(avaliacao);
    avaliacaoGeral.addAvaliacao(avaliacao1);
    avaliacaoGeral.addAvaliacao(avaliacao2);
    expect(avaliacaoGeral.getAllAssessments()[0], avaliacao);
    expect(avaliacaoGeral.getAllAssessments()[1], avaliacao1);
    expect(avaliacaoGeral.getAllAssessments()[2], avaliacao2);
    expect(avaliacaoGeral.getAllAssessments().length, 3);
    avaliacaoGeral.removerAvaliacao(1);
    expect(avaliacaoGeral.getAllAssessments()[0], avaliacao);
    expect(avaliacaoGeral.getAllAssessments()[1], avaliacao2);
    expect(avaliacaoGeral.getAllAssessments().length, 2);
    avaliacaoGeral.removerAvaliacao(0);
    expect(avaliacaoGeral.getAllAssessments()[0], avaliacao2);
    expect(avaliacaoGeral.getAllAssessments().length, 1);
    avaliacaoGeral.removerAvaliacao(0);
    expect(avaliacaoGeral.getAllAssessments().length, 0);
  });
  test("nivel de Dificuldade dos proximos 7 dias", () {
    final avaliacao = Avaliacao(
        "avaliacao", "Mini-Teste", DateTime(2022, 03, 03, 18, 10), 5, "");
    final avaliacao1 = Avaliacao("avaliacao1", "Projeto",
        DateTime.now().add(const Duration(hours: 2)), 5, "");
    final avaliacao2 = Avaliacao("avaliacao2", "Frequência",
        DateTime.now().add(const Duration(days: 2)), 5, "");
    final avaliacao3 = Avaliacao("avaliacao3", "Defesa",
        DateTime.now().add(const Duration(days: 7)), 5, "");
    final avaliacao4 = Avaliacao("avaliacao4", "Defesa",
        DateTime.now().add(const Duration(days: 8)), 5, "");
    AvaliacaoGeral avaliacaoGeral = AvaliacaoGeral();
    avaliacaoGeral.addAvaliacao(avaliacao);
    avaliacaoGeral.addAvaliacao(avaliacao1);
    avaliacaoGeral.addAvaliacao(avaliacao2);
    avaliacaoGeral.addAvaliacao(avaliacao3);
    avaliacaoGeral.addAvaliacao(avaliacao4);
    double media = (avaliacao1.getNivelDificuldade() +
            avaliacao2.getNivelDificuldade() +
            avaliacao3.getNivelDificuldade()) /
        3;
    expect(avaliacaoGeral.nivelProximosDias(0, 7), media);
  });
  test("nivel de Dificuldade dos proximos 7 a 14 dias", () {
    AvaliacaoGeral avaliacaoGeral = avaliacoes();
    double media = (
                avaliacaoGeral.getAllAssessments()[4].getNivelDificuldade() +
                avaliacaoGeral.getAllAssessments()[5].getNivelDificuldade() +
                avaliacaoGeral.getAllAssessments()[6].getNivelDificuldade() +
                avaliacaoGeral.getAllAssessments()[7].getNivelDificuldade() +
                avaliacaoGeral.getAllAssessments()[8].getNivelDificuldade())/ 5;
    expect(avaliacaoGeral.nivelProximosDias(7, 14), media);
  });

  //Dealer
  test("Delaer", () {
    final avaliacao = Avaliacao(
        "Computação Móvel", "Projeto", DateTime(2023, 03, 03, 18, 10), 5, "");
    expect(
        avaliacao.messagemDealer(),
        'Mensagem do Dealer!!\n'
        '\n'
        'Vamos ter avaliação de Computação Móvel, em 2023/03/03 18:10, com a dificuldade de 5 numa escala de 1 a 5.\n'
            '\n'
    'Observações para esta avaliação:\n');
    final avaliacao2 = Avaliacao("Computação Móvel", "Projeto",
        DateTime(2023, 03, 03, 18, 10), 5, "Muito complicado");
    expect(
        'Mensagem do Dealer!!\n'
        '\n'
        'Vamos ter avaliação de Computação Móvel, em 2023/03/03 18:10, com a dificuldade de 5 numa escala de 1 a 5.\n'
        '\n'
        'Observações para esta avaliação:\n'
        'Muito complicado',
        avaliacao2.messagemDealer());
  });
}

AvaliacaoGeral avaliacoes() {
  final avaliacao = Avaliacao(
      "avaliacao", "Mini-Teste", DateTime(2022, 03, 03, 18, 10), 5, "");
  final avaliacao1 = Avaliacao("avaliacao1", "Projeto",
      DateTime.now().add(const Duration(hours: 2)), 2, "");
  final avaliacao2 = Avaliacao("avaliacao2", "Frequência",
      DateTime.now().add(const Duration(days: 1)), 1, "");
  final avaliacao3 = Avaliacao("avaliacao3", "Defesa",
      DateTime.now().add(const Duration(days: 2)), 5, "");
  final avaliacao4 = Avaliacao("avaliacao4", "Defesa",
      DateTime.now().add(const Duration(days: 8)), 3, "");
  final avaliacao5 = Avaliacao("avaliacao5", "Defesa",
      DateTime.now().add(const Duration(days: 13)), 2, "");
  final avaliacao6 = Avaliacao("avaliacao6", "Defesa",
      DateTime.now().add(const Duration(days: 10)), 4, "");
  final avaliacao7 = Avaliacao("avaliacao7", "Defesa",
      DateTime.now().add(const Duration(days: 14)), 5, "");
  final avaliacao8 = Avaliacao("avaliacao8", "Defesa",
      DateTime.now().add(const Duration(days: 15)), 1, "");
  AvaliacaoGeral avaliacaoGeral = AvaliacaoGeral();
  avaliacaoGeral.addAvaliacao(avaliacao);
  avaliacaoGeral.addAvaliacao(avaliacao1);
  avaliacaoGeral.addAvaliacao(avaliacao2);
  avaliacaoGeral.addAvaliacao(avaliacao3);
  avaliacaoGeral.addAvaliacao(avaliacao4);
  avaliacaoGeral.addAvaliacao(avaliacao5);
  avaliacaoGeral.addAvaliacao(avaliacao6);
  avaliacaoGeral.addAvaliacao(avaliacao7);
  avaliacaoGeral.addAvaliacao(avaliacao8);
  return avaliacaoGeral;
}
