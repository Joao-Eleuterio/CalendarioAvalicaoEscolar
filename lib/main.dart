import 'package:flutter/material.dart';
import 'package:miniprojeto/models/avaliacao.dart';
import 'package:miniprojeto/models/avaliacoesGerais.dart';
import 'package:miniprojeto/screens/dashbooard.dart';
import 'package:miniprojeto/screens/listaAvaliacao.dart';
import 'package:miniprojeto/screens/main_screen.dart';
import 'package:miniprojeto/screens/registoAvaliacao.dart';


void main() => runApp(iQueChumbei());

class iQueChumbei extends StatelessWidget {
  AvaliacaoGeral avaliacaoList = AvaliacaoGeral();

  @override
  Widget build(BuildContext context) {
    if(avaliacaoList.getAllAssessments().isEmpty){
      Avaliacao av1= Avaliacao("CM1", "Frequência", DateTime.now().subtract(const Duration(days: 1)), 2, "Teste Obs1");
      final Avaliacao av2 = Avaliacao("CM2", "Projeto", DateTime.now().subtract(const Duration(days: 365)), 3, "Teste Obs2");
      final Avaliacao av3 = Avaliacao("CM3", "Mini-Teste",DateTime.now().subtract(const Duration(hours: 2)), 3, "");
      final Avaliacao av4 = Avaliacao("CM4", "Defesa", DateTime.now().add(const Duration(hours: 1)), 4, "Teste Obs4");
      final Avaliacao av5 = Avaliacao("CM5", "Defesa", DateTime.now(), 4, "");
      final Avaliacao av6 = Avaliacao("CM6", "Defesa", DateTime.now().add(const Duration(days: 1)), 5, "Teste Obs6");
      final Avaliacao av7 = Avaliacao("CM7", "Defesa", DateTime.now().add(const Duration(days: 2)), 2, "Teste Obs7");
      final Avaliacao av8 = Avaliacao("CM8", "Defesa", DateTime.now().add(const Duration(days: 6)), 1, "Teste Obs8");
      final Avaliacao av9 = Avaliacao("CM9", "Defesa", DateTime.now().add(const Duration(hours: 4)), 1, "Teste Obs9");
      final Avaliacao av10 = Avaliacao("CM10", "Defesa", DateTime.now().add(const Duration(days: 7)), 1, "Teste Obs10");
      final Avaliacao av11 = Avaliacao("CM11", "Defesa", DateTime.now().add(const Duration(days: 8)), 3, "Teste Obs11");
      avaliacaoList.addAvaliacao(av1);
      avaliacaoList.addAvaliacao(av2);
      avaliacaoList.addAvaliacao(av3);
      avaliacaoList.addAvaliacao(av4);
      avaliacaoList.addAvaliacao(av5);
      avaliacaoList.addAvaliacao(av6);
      avaliacaoList.addAvaliacao(av7);
      avaliacaoList.addAvaliacao(av8);
      avaliacaoList.addAvaliacao(av9);
      avaliacaoList.addAvaliacao(av10);
      avaliacaoList.addAvaliacao(av11);
    }
    return MaterialApp(
      title: 'iQueChumbei',
      theme: ThemeData( primarySwatch: Colors.red,
      ),
      home: iQueChumbeiScreen(
        screens: [
          DashboardScreen(title: "DashBoard", avaliacaoList: avaliacaoList),
          ListaAvaliacaoScreen(title: "Lista das Avaliação", avaliacaoList: avaliacaoList ),
          RegistoAvaliacaoScreen(title: "Registo da Avaliação", avaliacaoList: avaliacaoList),
        ],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista de avaliações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Registo de avaliação',
          ),
        ],
      ),
    );
  }



}
