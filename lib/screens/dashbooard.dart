import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:miniprojeto/models/avaliacoesGerais.dart';
import 'package:miniprojeto/models/dashboardWidgets.dart';


class DashboardScreen extends StatefulWidget {
  final AvaliacaoGeral avaliacaoList;
  final title;

  const DashboardScreen(
      {Key? key, required this.title, required this.avaliacaoList})
      : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<AnimatedCircularChartState> _chartKey = GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> _chartKey1 = GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    var avaliacoes = widget.avaliacaoList;setState(() {});
    avaliacoes
        .getAllAssessments()
        .sort((a, b) => a.getData().compareTo(b.getData()));
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          const SizedBox(height: 24),
          const Text("Nível médio de dificuldade das avaliações dos próximos 7 dias: ",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,),),
          CirculeDashboard(widget: widget, val1: 0, val2: 7, chave: _chartKey),

          const SizedBox(height: 24),
          const Text("Nível médio de dificuldade das avaliações entre os 7 e os 14 dias:",
           style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
          CirculeDashboard(widget: widget, val1: 7, val2: 14, chave: _chartKey1),
          const SizedBox(height: 48),
          const Text("Próximas avaliações",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          const SizedBox(height: 4),
          ListaAvaliacoesDashBoard(widget: widget, avaliacoes: avaliacoes)
        ]));
  }








}

